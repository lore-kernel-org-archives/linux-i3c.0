Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189EDCD8CA8
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Jun 2026 20:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3T7P1Jc12qyXfhTnbTE5fuRgUlxT8FlVTDd3BjyLWZQ=; b=vDTDWnxc2RJcbY
	rO3Zf6ygvpONheoX5XbS9VdIxdCy19oUsodqyz1PU2OXpRhkMg21ftstu8BysFoB+LF4aIgwhR164
	iyd0crGohxnPQpLvDOS2rC84QBy//nMowYTbCldbO7sjrTOhGlev1xiN+TG54cz6V+ZBdhmOr3a4Z
	qXg7nnUnIWIqmmSHySLfdy8Chf6H2H8Mv+ByLjBQ8a795vpOyyfokOFMD/nwh7dMLvPJDeKAXMQ9u
	JxPp/GBGa+oa2fyBCOrTQ7pxDN343T7FO+wDE63o1VX3tLjFoWzo8ODG0S8BVA7ZIf9m7WXiaZRM4
	59YxV9jRQ8dS9XImtblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrJk-0000000DH7X-3Gdz;
	Sun, 14 Jun 2026 20:20:28 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrJh-0000000DH6K-2bhW
	for linux-i3c@lists.infradead.org;
	Sun, 14 Jun 2026 20:20:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7485FC4FED9;
	Sun, 14 Jun 2026 20:20:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A454060014;
	Sun, 14 Jun 2026 20:20:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6E56106C8DA9;
	Sun, 14 Jun 2026 22:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781468422; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=YKr2GSSiv9S/SZtQa3729D36YhtkHqc82B1FL4raaQo=;
	b=x6Tk3fKZ83N0t7zDLxqpdJIBQoMvFc02INWD9GAk7rpjOYv9sS8/TuvCTGZnIkarW2sfMc
	giu+q+H2rDzBcfiRMGaVkFMLdo88BjdoGTOZSuJVKICiz6easLi5K3GA4r+iqF2QTbik3E
	Sdb98zUEiqdAEd3x5GpHoy7tivMw2onInWi8gahzjeiDdjNkJUwDfRmwHQg6DOBtyKQEGe
	xLr0f2mRIjL/J0QFTMeKvgCQUZnURA5sw8+UUqiKoNGpSsQUW2i5PwIHtI1sFin/HEPVLH
	tE2PNFFPXFCYeYFNWcJxFiMznrxc1RCLkx9UoLrqzdEv5hUo68zrjJzVNfwPpQ==
Date: Sun, 14 Jun 2026 22:20:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 0/7] i3c: Fix IBI race, address handling, and
 reconcile DAA
Message-ID: <178146821209.334162.12368984504081364191.b4-ty@b4>
References: <20260612080107.11606-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260612080107.11606-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_132025_844692_FBC364A2 
X-CRM114-Status: UNSURE (   7.27  )
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

On Fri, 12 Jun 2026 11:01:00 +0300, Adrian Hunter wrote:
> 	Note all patches have now been reviewed by Frank.
> 
> Patches 1-2 fix a use-after-free race in the MIPI I3C HCI driver's IBI
> handling and make IBI teardown resilient to DISEC failures.
> 
> Patches 3-7 fix address management issues in the I3C core and HCI
> driver that arise when Dynamic Address Assignment (DAA) does not complete
> cleanly, culminating in a reconciliation step that detects and resolves
> inconsistencies between assigned address slots and registered devices.
> 
> [...]

Applied, thanks!

[1/7] i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()
      https://git.kernel.org/i3c/c/650716f23eac
[2/7] i3c: mipi-i3c-hci: Ignore DISEC failures when disabling IBIs
      https://git.kernel.org/i3c/c/ad7fba5cbd6d
[3/7] i3c: master: Prevent reuse of dynamic address on device add failure
      https://git.kernel.org/i3c/c/b3ba8383da4d
[4/7] i3c: mipi-i3c-hci: Tolerate i3c_master_add_i3c_dev_locked() failures in DAA
      https://git.kernel.org/i3c/c/c236563c8a84
[5/7] i3c: master: Make i3c_master_add_i3c_dev_locked() return void
      https://git.kernel.org/i3c/c/689d0bd8f4ad
[6/7] i3c: master: Move DAA API functions after i3c_master_add_i3c_dev_locked()
      https://git.kernel.org/i3c/c/94daedb41d28
[7/7] i3c: master: Reconcile dynamic addresses after DAA
      https://git.kernel.org/i3c/c/4438609ede52

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
