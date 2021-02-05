Return-Path: <SRS0=Yvk/=HH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F1BC433E0
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Feb 2021 23:44:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0FA464FFE
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Feb 2021 23:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0FA464FFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Eoh88iCmX3hlKWmDJawtseANEmUnSHTtoGz7I68dkI=; b=oyvvRZl6loDe1phYz3Glqpuhj
	HF+IZeuLg5NWtbI3fy7kMuQQpPmnxcVWcFmdtmeqctQL0TiK0S1AOkaVtoux/99heBbqUErqow7L1
	B5g6i8dbfJ7BdEZrtyLwlri5aSj+L6IC/XaSAVA76pqEkyp07iFaCQRPAP5zS2JX07hzsxofiQBlR
	326c+Zp5p8BC08YqTz2Ew97j+v9q7ehgsjwzP2IpB28BdcF+eEwqYwfTB1NjJLzXMzVl1djsv7lIw
	4ChtWPuRShXEIY30twkhaKGux8db+Y2F+684pikvGMrr6AsCm0ODmPpEoed2Dv+AWsPmzbxbnh5kE
	0WP/WEfVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8AmF-0007t6-LR; Fri, 05 Feb 2021 23:44:39 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8AmC-0007sH-Lu
 for linux-i3c@lists.infradead.org; Fri, 05 Feb 2021 23:44:38 +0000
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 20C62240008;
 Fri,  5 Feb 2021 23:44:30 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH RESEND] i3c: master: dw: Drop redundant disec call
Date: Sat,  6 Feb 2021 00:44:28 +0100
Message-Id: <161256866173.4836.3780146529249506859.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228105501.6104-1-miquel.raynal@bootlin.com>
References: <20201228105501.6104-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_184436_823663_421EC366 
X-CRM114-Status: UNSURE (   5.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, Vitor Soares <vitor.soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 28 Dec 2020 11:55:01 +0100, Miquel Raynal wrote:
> Disabling all event calls is already handled by the core right before
> starting the DAA process. Do not do it again when the DAA process
> completes, it is redundant.

Applied, thanks!

[1/1] i3c: master: dw: Drop redundant disec call
      commit: 5c34b8e7e8bb605925b33e1aa7dc17966811219a

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
