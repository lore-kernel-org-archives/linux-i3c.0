Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6501C30658
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jul 2024 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7AYRlnSYkV92oSG3dz8GMeex88KKObrOsOr5IXWhMQ=; b=qO/6eF7qTV1s1mzs7Xfz0TlzvX
	aqzvvHvcqq35F7F51DKMp0TcIus/Eii9IsbOneU5dqRFwywv5X0L6yGpiur4TXAT/hQgyObzyXAiX
	cbw5yjdC/uLrmCqL0c1/bvHEJynXR5kxbTqrtVS37D+ss8IcnBAWq4kdtYSL1ssjSWiH8rNDRgipb
	Dy+msjcZsC/3fLKGquAt8gSgMyy+NX2goVGg63JNdmRBOMfSOtIBobo33LutmjFXWcUeC8LKpjxkG
	/7VYvrt7JTBEfI5tSO/vCubCOQ0P1wp5w6mV/ZUEMeMBT7hqnIcJgDAU0q8piV9souzgS5Xon+XlA
	Vt2YDj7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOfen-00000007F7m-1brD;
	Tue, 02 Jul 2024 15:43:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNEUj-0000000EM09-1SnQ
	for linux-i3c@lists.infradead.org;
	Fri, 28 Jun 2024 16:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81B1D62120;
	Fri, 28 Jun 2024 16:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBF4C116B1;
	Fri, 28 Jun 2024 16:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719592240;
	bh=e75xFRBq/xbtTG9yBdDrHh24XkoiCk2+XBxSyZ8Bin0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hn8OzUwQquhTLQ6PIeJ86mcII6QkUIx0eM+GsSiC7gIuC6DhKjTb0gFlJxlhQI/gS
	 6a4YaFwk+4QTQ9jLi1IRjSIxM5SeoP6wt+WnnYDKWf34BPmSSF+Y22H7zs34fa5Rp0
	 WaxR30UhBffGqICj0LFortFhAk/6FbyIMsJwNp8tAhJDOiKVMtpP0ndxysC8sCOCVj
	 jnoefxUx7+G6dd1fQgGUNuwPu6WkCdz8XvuceO+y5BX1er+g6458JYk3a0QHQpd/UB
	 A3rUtKBzLsE3XtBIEKTfr+xf7DZ87yxZNz8Zjq2bUDJvLs+pR35xK7eQLvaGo2HHBn
	 314/35mwWoVYA==
Date: Fri, 28 Jun 2024 17:30:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Aniket <aniketmaurya@google.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: dw: Add apb clock binding
Message-ID: <20240628-primp-recite-6bf752fc5257@spud>
References: <20240624052851.1030799-1-aniketmaurya@google.com>
 <20240628154526.324068-1-aniketmaurya@google.com>
MIME-Version: 1.0
In-Reply-To: <20240628154526.324068-1-aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_093041_461550_E2102524 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 02 Jul 2024 08:43:01 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7281666912545979445=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============7281666912545979445==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ob0bapJuyJEYyaEQ"
Content-Disposition: inline


--ob0bapJuyJEYyaEQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 03:45:26PM +0000, Aniket wrote:
> Add dt binding for optional apb clock. Core clock is mandatory.
>=20
> Signed-off-by: Aniket <aniketmaurya@google.com>

Missing a review from Krzysztof:
https://lore.kernel.org/all/e3160411-59e0-4806-a00d-b99564384180@linaro.org/

Also, please do not send a new version of a series as a reply to a
previous version. It'll bury it in people's mailboxes depending on how
they sort.

Cheers,
Conor.

--ob0bapJuyJEYyaEQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn7lKwAKCRB4tDGHoIJi
0ruUAPkBtFdfU50cjfk8UhQgDwLbvPQeNQB8jG5WUUuLI9GAsAEAxkwmAByLdNck
y39iiS9320Jb4eXj38Oi+Ga9rcI3rAg=
=aXhn
-----END PGP SIGNATURE-----

--ob0bapJuyJEYyaEQ--


--===============7281666912545979445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============7281666912545979445==--

