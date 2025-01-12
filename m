Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3474DE7719F
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Jan 2025 23:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbUCE0Se1C39MTf1aEpIAjevsxGd0lDUWumWz1CYhrA=; b=UR/9qp/I2o7Irx
	xIgdJwbNnYruGfjKQqJI2kuqw+zqjSRI4IJClwp453aEYvOvIkQ2vRQTnNHHB60hmDIeKtMiV5ZLH
	27rfn1FscHsLt5N/zYGFAzYK+WmE+65W9bemSGEZYg8fUcuv0gQU1XFN2Z+ufGi1j6ZUiKwtQNXg8
	dmFnHWs7tBboQ2OcK+QgDQ493MrMe2AZ3PDgprB3Mq6JxDLJlegSrV79JBMCvyyw4Vp90cgG4w2Q5
	/jYGkF8Sj/XoJcpVRbfsauhNt4go+3bzbIvnQYUfZWsda6W5tBq7BPXvJQjNp//RBQ9bvBC2ZTGtc
	KpECpgXBhLGG6cEXDNJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX71l-00000003aax-428l;
	Sun, 12 Jan 2025 23:05:53 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX715-00000003aVJ-0bkf
	for linux-i3c@lists.infradead.org;
	Sun, 12 Jan 2025 23:05:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79A47C0002;
	Sun, 12 Jan 2025 23:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736723107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K7+ie0nzNqQuHab8mm78UbXRHJOJCUPMvYctqDi42QY=;
	b=Qt0UpYwp1Zom8NeOSu7f+tAfHqm1xQ9mLpv1dR4cNrIKEBvMTmEPgR+qwZ7Ba0+Spz88o2
	a284rfu3NnwgbhXnMrMfhBPcb+vlFF3kjfOa1nNWY40npLcny8dUgQiwqgTWBc2TaPD7bj
	MaYIoSGlNU5mzDsH5Kp0GHAbU11icWIQZ8B2BQaQyUBEA+MEw4xmgUREmpToAxt8nBUEtx
	kaHT/Xh/PeVcXqh+vLE+Ly/aJXzwYw+uZiAHlXRLEeBk84JM/fpqA4dHBTx2v6GA+mY1kr
	qkv5NiiGF6CsBq8pVheOcSmyHPJ495uz/eTs6kIfwulFIO6twwlUFfZEy3En1w==
Date: Mon, 13 Jan 2025 00:05:07 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: fix kdoc parameter description for
 module_i3c_i2c_driver()
Message-ID: <173672283104.1485431.7286252526391577976.b4-ty@bootlin.com>
References: <20241219220338.10315-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241219220338.10315-1-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_150511_314748_09B5A0D2 
X-CRM114-Status: UNSURE (   6.07  )
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

On Thu, 19 Dec 2024 23:03:37 +0100, Wolfram Sang wrote:
> A typo mentioned I3C when it should have been I2C.
> 
> 

Applied, thanks!

[1/1] i3c: fix kdoc parameter description for module_i3c_i2c_driver()
      https://git.kernel.org/abelloni/c/0d2c022ffa7c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
