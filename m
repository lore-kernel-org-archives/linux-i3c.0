Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DAFCD98C5
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Jun 2026 20:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZdoeS008juhObmpgpP6QCLFBbn1mos7VygcXhtz6FJU=; b=BNPpT8XULSd+Np
	dCIUOpRFsYT6QKp+9tHaepc9jdJjn5J6Zm/n6hIL6w0T+uF2H0urXwTiUgyLbbOyyD7PWExiDhNw+
	jWwdLzCv32XJCXmMgF0j3eOz6nvD1MW7KFpyojYOAy0Mx5R7yBbhqkru4/Ddo3Jvl/vgwqaX2E2DE
	DZRYCnzj3mTe0ms32MgSyj4J0cmB66XsE/0OUpzYOtSmJ7bjxKd0BGxr42cfgoRu3H6r3NVTFxz0L
	RMO4wRaGs0Ed5HWGRHq0E6njKbV7r8RrUShrAW+IEAvCDwh++ee8lfSUchvIYMG+ALaVRXeRzb7Pj
	iQxTB3zKp0Qtg0ZRAKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrJe-0000000DH6C-2vsc;
	Sun, 14 Jun 2026 20:20:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrJb-0000000DH5c-136k
	for linux-i3c@lists.infradead.org;
	Sun, 14 Jun 2026 20:20:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6D37E4E42EFB;
	Sun, 14 Jun 2026 20:20:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42DD260014;
	Sun, 14 Jun 2026 20:20:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C172F106C8E45;
	Sun, 14 Jun 2026 22:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781468412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=MKnXBw3LUPua2lAikaudlUt+Hkjq7Sz9LzNy2VLycXE=;
	b=zwIDels+MFTgROhWp1DqEEf/2aZLfUzdhXR8kbhLORKgFv0BmaMIxuiGgw6QP3D5bRBju8
	u7wDe6r8BvkrWcH9ROrzKHWhAAXDHWJTgOsgiClqMAAQQ+wxQBJLjQZNT4j8cJo1qICa9W
	d2AabwLK+4gLvyk3KUxUDKQu33nJ8HctPYzZ5FaTsrDAK0fR4LKxOZEU6OJjpMHL+wZEWL
	iQx5ztO8LULoEPY+8qxE43qR/1hynzpo/8kYlklG4crxuMUZx/qRZ7U+WGeEbKqhPDCSmW
	RVDif37DO70yN+owf374CwNGK1eUUo0Y4/jolC9UEKNVL6uyQroxImvjG19bjw==
Date: Sun, 14 Jun 2026 22:20:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, david.nystrom@est.tech, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 0/8] i3c: Hot-Join improvements and MIPI HCI Hot-Join
 support
Message-ID: <178146821208.334162.17279956167370641704.b4-ty@b4>
References: <20260608054312.10604-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608054312.10604-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_132019_505184_13D063F2 
X-CRM114-Status: UNSURE (   6.81  )
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

On Mon, 08 Jun 2026 08:43:04 +0300, Adrian Hunter wrote:
> This series tightens the I3C core's handling of Hot-Join across system
> suspend, shutdown and unregister, consolidates the per-driver Hot-Join
> worker into the core, and finally wires the MIPI I3C HCI driver into the
> new Hot-Join framework.
> 
> 
> 	Note all patches have now been reviewed by Frank.
> 
> [...]

Applied, thanks!

[1/8] i3c: master: Make hot-join workqueue freezable to block hot-join during suspend
      https://git.kernel.org/i3c/c/527756cb9ebb
[2/8] i3c: master: Serialize i3c_set_hotjoin() with the maintenance lock
      https://git.kernel.org/i3c/c/5b130aadc36b
[3/8] i3c: master: Consolidate Hot-Join DAA work in the core
      https://git.kernel.org/i3c/c/828c6130235d
[4/8] i3c: master: Ensure Hot-Join operations are stopped on shutdown
      https://git.kernel.org/i3c/c/8323e783dc39
[5/8] i3c: dw: Drop redundant Hot-Join cancel_work_sync() in shutdown
      https://git.kernel.org/i3c/c/0cbefeafd2cb
[6/8] i3c: master: Defer new-device registration out of DAA caller context
      https://git.kernel.org/i3c/c/3f79dac3ea1c
[7/8] i3c: master: Export i3c_master_enec_disec_locked()
      https://git.kernel.org/i3c/c/4bfba7b360da
[8/8] i3c: mipi-i3c-hci: Add Hot-Join support
      https://git.kernel.org/i3c/c/32fcf0039814

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
