Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8CE606A31D
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FMqlGu7f;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iCf5DGpw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BkqxAIG9DG/+l+KnfBC2lEh12d+6WMUfQFYjJdP5QCw=; b=FMqlGu7fGOFL86OBS2T8Ui0ibM
	TYAdqG6JEh8amHncksMIi2VbieqZBLJk47h5d++I7Ff9XKRZSPolS5Z7+aOTG3UwxpIQ5SFy7SFyY
	5u4+KvKnaAWlWyKBAO1bgTuewkAa1JH1pDclqgWm30FahTLAesYWL+Wi43RII4EWgZYRkjqJk6fjk
	rL3iWbqbGxSH/JeExtWkUaAWl8DB0Xw78snCyEOi1HkK/shFJflZrWtykXdWhrPBpTWj4BSeAn82r
	Va9dmzKKaonnaeEzPJrypS7yIG0FV6SrCEON/MJiFj8IKygM6R5eTLXAMJRyEk1KDKRdOg2hVjA2t
	gnkIyVDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLevD-00000004NDc-0Rbw;
	Tue, 27 Oct 2026 11:00:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXf3-0000000H3n2-1xEf
	for linux-i3c@lists.infradead.org;
	Mon, 24 Aug 2026 16:36:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E44C960120;
	Mon, 24 Aug 2026 16:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E441F000E9;
	Mon, 24 Aug 2026 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787589396;
	bh=NcJfqU3hhh0N2f+LhLSYJrMHUg3fyi23x90RzpowY4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iCf5DGpwzbVYfZorDLkqnCW8oCuUmQtxHBs5soJkocRBjtbm+Grqre8hQsg8/VvnH
	 rmwVPKbZ6J2IHzo9Z4ej97o4W+6sehZDH/1L9ttj9I9wbaLUJTcYysPI0KIXZEnc+3
	 RlesNsGqoo7EGq0QLVZV5HO1MW4boCsVZ6q2JLfnPW/drqRSjNv5MnBdaQMe020WTv
	 BsoI0QPp3pepTM8YPLGicI9JTvsJtO9UrMEM9FzLCUAvRTmBPZYBrhcPkv2WiPAYuM
	 O+I1f3hjvVKenQIlQbZ3NDhOQavop7i0mY9Ol8Hjg8zpo6k7UHn0QKHAiw7Anmu4bT
	 r23Utd62UJ7SQ==
Date: Mon, 24 Aug 2026 17:36:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260824-tightwad-impose-495476599087@spud>
References: <20260824044835.2924141-1-shubhamsanjay.patil@amd.com>
 <20260824044835.2924141-2-shubhamsanjay.patil@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260824044835.2924141-2-shubhamsanjay.patil@amd.com>
X-Mailman-Approved-At: Tue, 27 Oct 2026 04:00:48 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0019114142156826986=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0019114142156826986==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2nVUbACzI3Wa37D7"
Content-Disposition: inline

--2nVUbACzI3Wa37D7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--2nVUbACzI3Wa37D7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoxzEAAKCRB4tDGHoIJi
0qWQAPwJicahO2YkHBPE6W+F9qcO4FfoJ8P4V4IZxQ6HCneSHAD/QFpZ39DWakpl
mRbMJ6lfYzDBao0LuXjKv9DH/W4xjAg=
=KJS0
-----END PGP SIGNATURE-----

--2nVUbACzI3Wa37D7--


--===============0019114142156826986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============0019114142156826986==--

