Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FD0EC872D
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Sep 2023 14:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UyxAUcTfFZ+H1LqH+LLwKSTT958qKUKh+IhrYDKXxic=; b=X9iHbjxuVASLLD
	OT7zwZuURqyQrMmyFlYDFCg+6Kbeg2WjJuMdmcDg39LCTCVihQNTgp8pqoGsbO0mREg14zUMBEI/R
	Xg9EbSQ5TrXk1asV+QlRviMsyUk99P/ZVQ6/MVwFgnIIEvu/2Omi+4Gp3t3SJTc5psY4bzsFY5uYa
	ihRhEEa42iO35d8UI7eKqYrebjUepgz/8avOQxEVr/njKcR8HEkeQBm/7UCaDQkxiyliNByQ+EEMa
	25A3cR6bga0ZH0ovm3AC+RUYWoPNreoosdFXJRBAshPGIMBHcohr2SACrhnkGhpIcvXVLtDXv/Gdk
	oZZS6UOwS93YP/SCBoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeFc5-00CAlp-1O;
	Thu, 07 Sep 2023 14:04:05 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeFc1-00CAlE-1S
	for linux-i3c@lists.infradead.org;
	Thu, 07 Sep 2023 14:04:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4755E1C0002;
	Thu,  7 Sep 2023 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694095434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5FVoeRE07rZmVlLkQmIs3J1N4DqM7HTxwYCfMm6OyDk=;
	b=QW7cMRFbQRMMJiDTBaUTA7BYmlHH363PbQOFES3rnFU29o1Excsxwm8HF4X9kri0S56as1
	N+trm+HAQa+L0X1eN5RAiTGsm+LvDSXqA9BMFNNmycfKuH0YKC1dTmNfad8Ei5nbPxijVy
	y8XDCBSetog4MiulF4Nf3I1agrjkgTFtThFhss+2syQK+yiM1yrPt9YZxfgByeWQfVXDg7
	72v0tg4284rNOpysKK6n3NvQA45kehFEWFWNKj8sKxgmcmQTUXvLapCsoP2y9lrOmWNVyc
	NV96qdPjeYQbrGNtXJ3CCCtV3d91lJvWxE6iz0OzY83CBpzPvusS4DfCwFZwGA==
Date: Thu, 7 Sep 2023 16:03:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] I3C changes for 6.6
Message-ID: <202309071403530b8897e7@mail.local>
References: <20230906220710e64b2b71@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230906220710e64b2b71@mail.local>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_070401_790400_0B0EFA36 
X-CRM114-Status: GOOD (  15.30  )
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

Hello,

On 07/09/2023 00:07:11+0200, Alexandre Belloni wrote:
> Hello Linus,
> 
> Here is the i3c subsytem pull request for 6.6. There are mostly small
> fixes as people ar finally starting to have access to actual hardware.
> 

I forgot to add that I extended my signing key expiration date so you
should updated my keyto be able to verify the tag signature.

> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.6
> 
> for you to fetch changes up to 6e13d6528be2f7e801af63c8153b87293f25d736:
> 
>   i3c: master: svc: fix probe failure when no i3c device exist (2023-09-06 01:21:47 +0200)
> 
> ----------------------------------------------------------------
> I3C for 6.6
> 
> Core:
>  - Fix SETDASA when static and dynamic adress are equal
>  - Fix cmd_v1 DAA exit criteria
> 
> Drivers:
>  - svc: allow probing without any device
> 
> ----------------------------------------------------------------
> Aniket (2):
>       dt-bindings: i3c: Fix description for assigned-address
>       i3c: master: Fix SETDASA process
> 
> Billy Tsai (1):
>       i3c/master: cmd_v1: Fix the exit criteria for the daa procedure
> 
> Frank Li (1):
>       i3c: master: svc: fix probe failure when no i3c device exist
> 
> Miquel Raynal (1):
>       i3c: master: svc: Describe member 'saved_regs'
> 
> Rob Herring (1):
>       i3c: Explicitly include correct DT includes
> 
> Ruan Jinjie (1):
>       i3c: master: svc: Do not check for 0 return after calling platform_get_irq()
> 
>  Documentation/devicetree/bindings/i3c/i3c.yaml | 15 +++++++++++----
>  drivers/i3c/master.c                           |  6 +++++-
>  drivers/i3c/master/ast2600-i3c-master.c        |  1 -
>  drivers/i3c/master/i3c-master-cdns.c           |  1 -
>  drivers/i3c/master/mipi-i3c-hci/cmd_v1.c       |  2 +-
>  drivers/i3c/master/svc-i3c-master.c            | 19 +++++++++++++++----
>  6 files changed, 32 insertions(+), 12 deletions(-)
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
