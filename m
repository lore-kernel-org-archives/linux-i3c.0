Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57091C7EE2A
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Jun 2025 20:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2znFN2WUpt+/hoMWyjVpDjbMtN1BMuZ/dM6NolL75Ko=; b=coQEEMWOQQRLtu
	2/6/4I40NuvaDQ2R8H60LLawrYA1kdOq3pL/G9CkODlhrJD1WihkNbINXcb/mrcP7X5W2Ic89nKfh
	OGiNwc4l42UZxYJ+icJbyZgntCcKjkVwna66KnOs2hZCJheo4WEsdw0ZXujtc3TLRCu69gtoQNK56
	hOPgpdCQ5v7uFMT+mxxo6QC4YsukxLxb/8zdX2rLQB9J+RqX4DFRBcMPTAgX+SeIng3XPfOye6PDP
	C97ippuwkKPgkf2Xit02ITVEeZQBPRZ+584SkyTRmDqs2jXOmO81goEU40xz0UeRuwXdTBjuII0Sc
	ARz4QuskOO1ZA4/WyLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWpf-00000009r3j-0M7L;
	Wed, 25 Jun 2025 20:34:59 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTBu-00000009Kxj-00eH
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 16:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rrkX
	ASEyQkbmanZAMXQwDaQOSFVKc1m7TVvpIZ6DXl0=; b=jZWKtH4XyRSZ541zXgnS
	LC2lItME4UzOeD/uzanZYNkbRixPq7jNdXdiUH8oFrj+O7vECVmP+arxqxGerSp8
	XMIOkeccJTo0gpTrO2SkUj9kYDsgA01FSf4aYGCybDxe+veOBrWdzG/+h45oswSG
	1emwY7OKwQxejYhU3Wqk0lCB6AuSYeDveeONE/vFPG2SGbMfJIy4IrcnfGHMeqXK
	CiJ0K7qptSPZouHyUqL3hwolO+V1+rxjd61K6mpxU3+YNp9NcwgomYg96jtjYfmS
	oEGWZAT16Cu5XSP5C3Kl1So9Y/w+tN9HBUEKIqnFgpP6mp8oVNEudaPPgY3MLBEk
	VA==
Received: (qmail 717444 invoked from network); 25 Jun 2025 18:41:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 18:41:38 +0200
X-UD-Smtp-Session: l3s3148p1@8ApmHmg4qA1tKPJN
Date: Wed, 25 Jun 2025 18:41:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: don't fail if GETHDRCAP is unsupported
Message-ID: <aFwmwduUm8KuJlny@shikoro>
References: <20250625073505.7949-1-wsa+renesas@sang-engineering.com>
 <aFwUx65gdpv6H6rU@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aFwUx65gdpv6H6rU@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_094142_914133_BADBBA1C 
X-CRM114-Status: GOOD (  14.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


> > If a target has the HDR_CAP bit set in BCR, the core wants to get
> > additional information using the CCC 'GETHDRCAP'. Not all controllers
> > support this CCC, though.
> 
> Do you know which target device support HDR? I3C master API don't HDR yet.

The problem is bigger but I didn't want to tackle all of it right now.
'I3C_BCR_HDR_CAP' is still spec v1.0 and has been renamed to 'advanced
capabilities' in v1.1 onwards. That means the CCC was also modified to
get the advanced caps (while it is backwards compatible if you only read
the first byte I have been told, didn't check). So, if you get the ST
pressure sensor LPS22DF, it will not have HDR, but it will have the
'advanced cap' bit set.

Because my controller neither supports old GETHDRCAP nor new GETCAPS
CCC, it will bail out and not instantiate the device. Which is wrong,
because we can deal with it good enough without the extended
capabilities.

Maybe I should update the commit message a bit?

> This is not fatal and can be safely skipped, as the information is not
> necessary if HDR is unsupported by the controller anyway.

It is fatal because the target device is not instantiated while it
could be. I tested it.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
