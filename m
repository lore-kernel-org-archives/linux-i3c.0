Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99213C83030
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Jul 2025 06:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijs1GhLTnzJRDnh+tuC0BEe/N6PxpkmMc+swW6IroOk=; b=ymEfDVe2I+NxxY
	FoyMzx3fR9hxG4bn5D6+CnUNys+h+Sg0s/AR7i2ysVnv7N6A4x1BKcObhHAZIsImX4l8ir6hKxUeV
	TenqOQq4agejkLvTjm/Ze5rAy5S1wFK4n39OfNBy2Q84ULHm6giANnq7L7ZFVNJhVmMu7Hiiddjrz
	a+VZOWDYynK2g2pJUPAwLA7xIpAAar7zAqv1jjOV8+tx72kujpcclXaQJ6I3hMgmytfBeRYnOkITa
	LuIT/ZZtSU7mvWi2j7An/Bl4CyhhkP8BeIkpHygOM/LYVuzlwMtvf1N5OVeN4QzlYRpox4vAtFYCv
	f57l7kkl60mS/GdihI5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXDjS-0000000AQ9s-1XCx;
	Thu, 03 Jul 2025 06:47:42 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXDdy-0000000AP8D-1PYs
	for linux-i3c@lists.infradead.org;
	Thu, 03 Jul 2025 06:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=N+t+
	R2tbEvS8iPGpTfOUgvUBhLFV48JiJQy6YPMese0=; b=QTpi9sN66IUiSkPkBADA
	ZjwjoONxTbnb1is5b5SCV9XA/Qcek135MbVUHQLK0X4dLxdv8SkGztIaz9l9JThy
	TvKHHMnKk1FOijwtsZNdxV99JaOk3VS0SqKFYC29+Kdn6F8bBLy/grayflE8dIeE
	CJSTEfnl9v91UMXgdQxaS1IWx75D6ce4FQINfk2g9q21ESMhhbZHHn3iljersEKD
	Pd3EVWoW5wOwHL4SDvIcWXBsHk47L4/uhHKIbfFpqzIjBfmKso0zg5vCpstUq41C
	LP8ZGItcBJsEfOprUCmqOdTe0uL7Jcyd72NHQOKQlapwpp1ODerxlETNJ46YcVQh
	hg==
Received: (qmail 3755582 invoked from network); 3 Jul 2025 08:41:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jul 2025 08:41:57 +0200
X-UD-Smtp-Session: l3s3148p1@H/F8rAA5kskgAwDPXyUmAP5FmBXRrw7R
Date: Thu, 3 Jul 2025 08:41:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: Frank Li <Frank.li@nxp.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: [PATCH] i3c: don't fail if GETHDRCAP is unsupported
Message-ID: <aGYmL9CpZHUtEm85@shikoro>
References: <20250625073505.7949-1-wsa+renesas@sang-engineering.com>
 <aFwUx65gdpv6H6rU@lizhi-Precision-Tower-5810>
 <26c2b49b-713e-4e9c-8bf4-0ffbd0b4b050@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26c2b49b-713e-4e9c-8bf4-0ffbd0b4b050@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_234203_250066_FF69A2C9 
X-CRM114-Status: UNSURE (   5.55  )
X-CRM114-Notice: Please train this message.
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

Hi Joshua,

> I'm use `MMC5633` to test out the HDR-DDR functionality master functionality.
> The patch can be accepted as some controller might not support HDR.

May I read this as an Acked-by? Then, I would add it when sending v2.

Happy hacking,

   Wolfram


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
