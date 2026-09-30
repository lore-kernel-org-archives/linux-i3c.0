Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A39CA5FCD
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Sep 2026 14:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/dckG2IF4ajzCI4BlU5wp9Q62bfVS/PUYfy2WY2ix3Y=; b=pD2c1EajG+VCfh
	8h2tljZzC4yPO9MBJUuBb8rXiA0UNMrl+3cluZRLpteJU8Slgzy+FvP93n93Dqc/ROZiLBn6aaD1R
	3+gt+fAba0lV6mbNiMGVAgUai0WYz+KBC2PX6jx1juJMY6rhRHHO3sCo39NzE+YiTbUydFQDszbL0
	5ipP5EguvjioNJTbY/PRTDOpt6Hy9OQ7vY9Yjxhy2yU+lXh76tpD7NblqkI3GDYUwMlyXK97Z7gBR
	NWUukPqFXbQ3heOPgtIXFyUI8I2ty39naJf2CD8BYjsZ9jcxzJTfETTw1HJBNumULfEv83ZeDv7gd
	KN5LNf8dbxB0gn2xcyAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvBQ-00000006IWP-2NVn;
	Wed, 30 Sep 2026 14:21:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvBD-00000006IOD-42rW
	for linux-i3c@lists.infradead.org;
	Wed, 30 Sep 2026 14:21:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 73D6A4E410E0;
	Wed, 30 Sep 2026 14:21:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48AB060749;
	Wed, 30 Sep 2026 14:21:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBE6F10329695;
	Wed, 30 Sep 2026 16:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790778065; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=bz4aEAjIOZ8PfQj3Jib8J+GC/znjg8tbeLTvSSDYMpw=;
	b=hOSMR72SSef0CLaVHSvzYlMFuEvoR9PnDYFJomJtR/0mv2uMNkFyi1ZOPgmrDZPCx6Vzsk
	TlCc/VwiCReo0rwFlpeW3Kq0poM72vrH7riGajHR72EVnuEQ8UvnBg3MeVpDl9ZGW+eJ1X
	cfZM8ixRhte4Dt+gCoxj2xb5gYxoYdSZ4isu/2mFh1reY2gcv7kzkNsgO86Ur7CrRC5vl3
	OI9NoOHGBGpSLLa8pZztQlq27h9NEkM98tRyqS8vYosmjYsQQoRJgddirDRyndSyvAg9AT
	C6dPFgVbmX60jQIuEa20l3e/mSwqgE9iF8IpCIz3jowcf0Mm4FqJzk+zsZUyYg==
Date: Wed, 30 Sep 2026 16:21:04 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: use named initializers for acpi_device_id
Message-ID: <179077804632.406255.945971316168096884.b4-ty@b4>
References: <20260923-acpi-i3c-v1-1-2e78ebef251e@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260923-acpi-i3c-v1-1-2e78ebef251e@thegoodpenguin.co.uk>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_072108_264801_0E72B758 
X-CRM114-Status: UNSURE (   8.09  )
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

On Wed, 23 Sep 2026 16:47:05 +0100, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: use named initializers for acpi_device_id
      https://git.kernel.org/i3c/c/609611d21b61

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
