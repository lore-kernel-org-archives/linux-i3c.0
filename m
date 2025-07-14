Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9B1C83F36
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Jul 2025 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvcOipENZHdD4CRhFFtk6z5VNovqBbIjlOXDf/BD5Dc=; b=NWUtz9qmsuTIDBeAzDS0gxr+9t
	v56zUn7msjbtjKwQqlFhKnuMFQwOqdpVXOX4JYZpW/HSh7R1eXO/ln8qHV3fp5MRRaP2jIuxIDYCW
	tdTOnyML7ffokvz+SQvJa4Ubrgsm0ESf3Hlyeffm0cyXf1Sl9KYFvo5ByZABfCjl5PmeNmYh9LLDb
	qzavink8xaO4yRZdHYvYHL6KVGa1aFyd6p95KLucBJPNQTOPCg8CqketAYsHAmK2lOhW8GnOOhKqi
	8vepkJS24VDesakRGP3YKzIRKLBC0RAeeEoKEHlRVJqgya+ncqKuShEJ7TqZ+QXG+7EZlFsypTxp8
	LTOsVgOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaJb-00000004NqC-2DHh;
	Tue, 15 Jul 2025 07:43:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubRxN-00000003RF8-0Mvk
	for linux-i3c@lists.infradead.org;
	Mon, 14 Jul 2025 22:47:34 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23636167afeso43569935ad.3
        for <linux-i3c@lists.infradead.org>; Mon, 14 Jul 2025 15:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752533252; x=1753138052; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9CpT0STFiAFhDC+XiDIJVAH7qMjwEzOnnwaeMJVhJI=;
        b=CDO6RbSrVwh2BCgTLAb1yI6/n5IoJvxPBfm59Vt004+dW/0pdVOv9c4ernURF3EDz3
         4PiJmoToUDKgC+zKmiZrsSD3I0rtOHsW+IfHrZnE8QvSNRaV0nXinn2lV6bWlANYV5Ml
         biHECYXm0dLemm1ze/6mJkwMI/S91AVRUoK0kx8JtpGRSNxNZv7Ir3IqErjlQNvQ+/UL
         ZNBBhaWtZqw3xK8sD+lQjxyYtq6rWzXX+pxeiddDyTgeeK/WCqb1X+XiIPA32Y8MZ7f+
         /6ohYbC0MLi2I+3ySkQk4Uy36BHmO+84/U5k4sJdBIh1bqXMTdQktE7PjQtUGuEti071
         GNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533252; x=1753138052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9CpT0STFiAFhDC+XiDIJVAH7qMjwEzOnnwaeMJVhJI=;
        b=mrU84ahCJ/dh1nfGetc7cRvxu+w4uvld6MVcCPyqdqhDiBZtmIAXDjNDs4YleJDyAy
         Ta6ra1y11wUhHaYFwX+gQqo3HAy3iPc/uZKgLVwMLPvGJAFi4m6RJqU5BJaZ8JzL/1R0
         FrjJTSUBhAqvv3kFFa4FrQUZHQGJECqyoSAdfCnRLuFy42xMctPQlWNsqPjh3VsV/S56
         xfMNrtZzixmLiNDzD1j+8B9LNlKU4uDJO8liiz+dsUfaDAz0OUofWivzukxuaMeBFoiC
         xR8517VsFG3YGVyryWcsPbTZCIoKyjT7qxidjCFWqKAVEbyUwzMkc1G2VkEutzWYDEyv
         1Bew==
X-Forwarded-Encrypted: i=1; AJvYcCUzEPyHxVEuSzAfzlvXpanxkp2wnnrY+rpDMsUaMZnIgrDfOv+JbHUq7PgBpVetn6g898MC1YvUloQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzU/JkayZ8Dy2hEWGVT3TcErqd0/COWwCleEMzQ3r70Zui8aPAk
	WuG8QeChXtvqyy7VnUZpit4EPRxKoiz6WKBYbfRiFiuYGajH6a+vVl1kTHbu5w==
X-Gm-Gg: ASbGnctu2S7+6ikyARmlrpWnPRK4VsdutU64yP2+5uV2SZ8IAb7PPkN/8zFm8ShFrzX
	6KuCVzBYs8P0o2HrTsYMwlbMY8Bdy+hhz6rjgKk5HWQ1k7Z3qYK7990LXqUvR4XgSCnM6fDV3mM
	ywyBrKfQh8DPmQorEadIbkRUSqbCnY3tE548YwfM6mnl3msSfMT9y3pGkBp8Saa1yzfPUUItn+n
	6TkuvGIigFXIo96zL8pDIaIGbyi1ULDwyin9mkEYmrPlnUdh7+qpl3UyN9p9yulTdbzQc2vyWqU
	VgaOfPVsBdpl9JZDHbSTTSn+yhBEiiFBLZH1Jg9WtZ7N2uDF+8l0MZEjxPOJ0yPV8n6xPArD7Mn
	+6RZhjWG9CwsW6zR8fMLonQ==
X-Google-Smtp-Source: AGHT+IF1QFrqAeVptFxp5k5tGy6a7yZnAQZgsCGC+pj4sAAOV0mvgCE75ZzBFg7tGpV7WycgbpuUPA==
X-Received: by 2002:a17:902:fc4b:b0:234:b735:dca8 with SMTP id d9443c01a7336-23dee1888c5mr228225185ad.6.1752533251308;
        Mon, 14 Jul 2025 15:47:31 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4285ed6sm98304745ad.25.2025.07.14.15.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 15:47:29 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 93B8D4206884; Tue, 15 Jul 2025 05:47:27 +0700 (WIB)
Date: Tue, 15 Jul 2025 05:47:27 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux i3c <linux-i3c@lists.infradead.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] i3c: Fix i3c_device_do_priv_xfers() kernel-doc
 indentation
Message-ID: <aHWI_wkGzKShpvhV@archie.me>
References: <20250702040424.18577-1-bagasdotme@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250702040424.18577-1-bagasdotme@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_154733_126464_34667E60 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 15 Jul 2025 00:42:50 -0700
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
Content-Type: multipart/mixed; boundary="===============2048979760465257466=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============2048979760465257466==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6+xiQCy5g/20dcQa"
Content-Disposition: inline


--6+xiQCy5g/20dcQa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 11:04:24AM +0700, Bagas Sanjaya wrote:
> Sphinx reports indentation warning on i3c_device_do_priv_xfers() return
> value list:
>=20
> Documentation/driver-api/i3c/device-driver-api:9: ./drivers/i3c/device.c:=
31: ERROR: Unexpected indentation. [docutils]
>=20
> Format the list as bullet list to fix the warning.

review ping

--6+xiQCy5g/20dcQa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaHWI+gAKCRD2uYlJVVFO
o8k4AP9Xw9u3OioKxAPJ0mSNhnv7gvEWEO+gbnUxuu4fqVPnZwD/Sf+pvejdCXGz
M14IYlW8wQsPimdQae50dn51Zw2omwk=
=xLk8
-----END PGP SIGNATURE-----

--6+xiQCy5g/20dcQa--


--===============2048979760465257466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2048979760465257466==--

