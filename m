Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D64606A327
	for <linux-i3c@archiver.kernel.org>; Sun, 15 Nov 2026 11:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AusTHmxA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ijmaewX4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XgvuXxmOlljNBJJMVBikmrAIBJPCNcFG/Ug+vQ+yFD8=; b=AusTHmxAvlALqLE2lCKnRkvSxY
	q3aAqOFmah6AafPgzR5F2IcLpiA6VgYR/MAp5hFlNZFqNoWNzkDSbpTXg9BTDsWAb3plU4CmBgVaq
	1LbwSN4ynaka0bepDSCY5/A1AEhdBHAP3g6k8J/crmvWqY6DdxJqpqdNw2KD8THPEHAF9jkXzYCPp
	hB/nT8ZxJiHsQ42fTsZtvQ/i13cZ+n1e/ifCJZAEEF1+XTIKbHF3fEZx/TsrYBY54GIEtxxKrDw1n
	NzWi+XutORa/3xjOZS5u1S3w7lADFvGILMFuYwXiJb8ryV9RFcvINnmFy8NQ/pph+9gpPGSQWbxK2
	jBMJcExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYr6-0000000HUIg-2hX7;
	Sun, 15 Nov 2026 11:57:08 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYr1-0000000HUIH-3ZMH
	for linux-i3c@lists.infradead.org;
	Sun, 15 Nov 2026 11:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zhhD
	m2qyru0LaqxksPFvsWC42WCRzYXUzwovCybxf/w=; b=ijmaewX4miP4ddwVG2zc
	FelrOxzBahZlunioU4qSakWVzoN8fPAagUD6YVAJ0ZOjcjb7/yv/V26nBnSPy/f5
	aYgQ9ONhYbdH9dKEWGVUN98pvjTap8Au+ouO1fOtBzgwrSHIxhWTWSaNXS89mdiE
	dxYYYJbHzWSkvfkdJRhHCxZRw62t5bI1k+1FtFb2PulTwIKeIm4jKvjOche8IkOs
	Q/hxqRt8wzUEEJjBR1XDrm74hJm9zznBOQBZN1TANbnnI8/KDlbMZ1ExM1ot4ARV
	l24JpZjPcT/mBTM0D/GEFmoUZCtwLC/jJiCpj4kDknMk4FuL+HKzwiqsi22ad4Fp
	vw==
Received: (qmail 906437 invoked from network); 15 Nov 2026 12:56:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Nov 2026 12:56:58 +0100
X-UD-Smtp-Session: l3s3148p1@cPS5W09g7qgujnuZ
Date: Sun, 15 Nov 2026 12:56:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: renesas,i3c: Document analog noise
 filter control
Message-ID: <avmeCELZRvJVNtyl@shikoro>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-b7ad60cde650@renesas.com>
 <ate-aNmqsyXCAIX8@lizhi-Precision-Tower-5810>
 <64f604a7-7e70-4a0d-8164-28c5d7b1e509@renesas.com>
 <at-5E3b_wKcnuJ9Z@lizhi-Precision-Tower-5810>
 <f4b8a714-dab8-45d4-b98f-717d010806de@renesas.com>
 <auC06gqa5lGtKPjj@SMW015318>
 <7dea4022-20d8-493b-b560-ee635deb7cbc@renesas.com>
 <auIK38HPyv7PmDJF@SMW015318>
 <db1ad309-c02e-4616-8486-ffa967207d44@renesas.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db1ad309-c02e-4616-8486-ffa967207d44@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_035704_788417_0ADFE92A 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> In the end we got confirmation from the HW team that the SYS_I3C_CFG
> register does not actually "exist" and was unintentionally left in the HW
> manual, meaning that we cannot control if the filter is ON/OFF so this whole
> discussion and patch series becomes moot.

Interesting outcome! But easier for us :)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
