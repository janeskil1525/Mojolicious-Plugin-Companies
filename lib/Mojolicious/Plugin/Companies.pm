package Mojolicious::Plugin::Companies;
use Mojo::Base 'Mojolicious::Plugin';

use Daje::Model::Companies;

our $VERSION = '0.02';

has 'pg';
has 'companies';

sub register {
	my ($self, $app, $conf) = @_;
	
	$self->pg($conf->{pg});
	
	$self->companies(Daje::Model::Companies->new()->pg($self->pg)->init());
	
	$app->helper(companies => sub {$self});
}

sub save_company{
    my($self, $data, $token) = @_;
    
    return $self->companies->save_company($data, $token);
}

sub load_loggedincompany_p{
    my ($self, $token) = @_;
    
    return $self->companies->load_loggedincompany_p($token);
}

sub load_company_p{
     my ($self, $companies_pkey) = @_;
     
     return $self->companies->load_company_p($companies_pkey);
}

sub list_companies_from_type_p{
    my ($self, $company_type)  = @_;
    
    return $self->companies->list_companies_from_type_p($company_type);
}

sub list_connected_companies_p{
    my ($self, $token)  = @_;
    
    return $self->companies->list_connected_companies_p($token);
}

sub list_all_p{
    my ($self, $companytype)  = @_;
    
    return $self->companies->list_all_p($companytype);
}

sub create_user_link_p{
    my ($self, $users_fkey, $companies_fkey) = @_;
    
    return $self->companies->create_user_link_p($users_fkey, $companies_fkey);
}
1;
__END__

=encoding utf8

=head1 NAME

Mojolicious::Plugin::Companies - Mojolicious Plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('Companies');

  # Mojolicious::Lite
  plugin 'Companies';

=head1 DESCRIPTION

L<Mojolicious::Plugin::Companies> is a L<Mojolicious> plugin.

=head1 METHODS

L<Mojolicious::Plugin::Companies> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicious.org>.

=cut
