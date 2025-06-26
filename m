Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F32C7EE33
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Jun 2025 09:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQR/AiH/OK6CgEpCgNwWKqwdXi0pkbY93S9zzdoHCZI=; b=y0qh2UHTMsRTKG
	S3zgOA84T9EeuirRZL9UWn8dw0Jg5Dl4zGoR1nezNHvOf+t8OUT5nyWWwQoA71gAT9GHFm+wmQD1f
	jK3FxQzVjOeWYqYSiELo2P2cZUJLnpn5y6YyLw2n5QHEJjd1V1VT7xjmz/MMwRASc0c04OevlNko/
	d1JgSe8wwxoTxnsqq6bopZ/9pNJxLOQrboMt7JwM8F4SsBIQVG9/YFkKQZDEsV3UnZt3K7tLxYoU9
	kPXc5PTK4oBB4XQ0p+7RDnuCIZOTtY8jZeNdTBXnPAqnferk98AuFtjvdxDpV6xgxMSqYYa2aTdE3
	JE0ti3TzuHla1bNpCGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjFI-0000000BC7C-0yCD;
	Thu, 26 Jun 2025 09:50:16 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUidm-0000000B6hy-3wF0
	for linux-i3c@lists.infradead.org;
	Thu, 26 Jun 2025 09:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Eeeh
	I820+vbYXqz5ZAdlcKhAicg7pFQoE1iRyfgvkis=; b=jl391GaCgtDBiK5ltUyR
	Ft3buEKQxhgmRrTOeJmBBqEQ7JWZF45QxCAzgCf0+0NGGOek5Qwa39JzNIAfRXO+
	6a/rA0wLQaQDSy7wPzptFTrPqf2/E1a9Qb4EVo/uVT5URp7T5WFudd9T8ELjFbpf
	rS0UVvPdlqsv2sr5CtE586mhXFAY+g9QvyBzIs9hDXnnP03nO7864FkivtPN5Bf3
	B01W+utOPoOvrzAbWYDqGDoDnZXhXLTam86yPptEK0ix3Q7Q+viR3ftT+r5Jgz2P
	Dih91qyUCWZwbYMbURNKIz3HVsrO3MVf+MHCUb7uo3XQRsN3r6YbI7G4j8RQduxY
	4Q==
Received: (qmail 974836 invoked from network); 26 Jun 2025 11:11:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2025 11:11:24 +0200
X-UD-Smtp-Session: l3s3148p1@MCYW8nU46tIgAwDPXzuUAOCQSK0rM+sw
Date: Thu, 26 Jun 2025 11:11:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH 1/3] i3c: core: switch to use SUSV4 error codes
Message-ID: <aF0OvNnmOIfpKwmQ@shikoro>
References: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
 <20250625130918.14507-6-wsa+renesas@sang-engineering.com>
 <aFxcbGQyfjaHOHDt@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aFxcbGQyfjaHOHDt@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_021131_838428_8F3EDF7F 
X-CRM114-Status: GOOD (  11.63  )
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

On Wed, Jun 25, 2025 at 04:30:36PM -0400, Frank Li wrote:
> On Wed, Jun 25, 2025 at 03:09:19PM +0200, Wolfram Sang wrote:
> > This checkpatch warning makes sense here: "ENOTSUPP is not a SUSV4 error
> > code, prefer EOPNOTSUPP" We don't have a userspace interface yet, but we
> > probably will get one. So, let's convert these error codes now, before
> > it will be forgotten in the future, and they could slip through to
> > applications.
> 
> I suggest the simple words should be enough.
> 
> i3c: core: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
> 
> Replace non-standard ENOTSUPP with the SUSV4-defined error code EOPNOTSUPP
> to fix below checkpatch warning:
>   "ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP"

Can do so, if you really want, but "to fix checkpatch warning" is
usually a not-so-good commit description. The above text tells WHY
checkpatch issues the warning and why we should care. However, I can
probably simplify the wording a little.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
