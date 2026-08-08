Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FAAC5AC67
	for <linux-i3c@archiver.kernel.org>; Sat,  8 Aug 2026 13:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJ57DJ3eHCW9jDR1dq7ev9afAvrOtsthRG8pdCGqUxY=; b=E+PtNFsoEWbL/g
	sqzyB241ghujaz4vEzSLmlIFCaYFsHADePZAd0AUTHmcRlm2XEJ/kAHUHtywqZWo1UX4jva23ivI4
	Bab49rmTf7bA5PlkMZSfxmlQN1IyG2ElbM1hcuDZOVlRBp3dP9s3eRj041uWsf7B5bMG6aACT+pZZ
	ZuIJ277/Li5kk/3aPzox2BVmRWCpDutE2qgKoUp0Vg0U/++9Z1kEHrI1nbTqnMaWaxPaaSJQAp6fz
	1IE+5xOfb5rPwBBcMQoIcKiNq0YndDWZ+FjELPfotsxip6suXcmSX5lwD2JRz4hNLH/SsY+c3oPB1
	2NXGeAY//KBxtpIqKacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsgpL-00000009NVk-1oNk;
	Sat, 08 Aug 2026 13:11:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsgpI-00000009NVQ-2a5U
	for linux-i3c@lists.infradead.org;
	Sat, 08 Aug 2026 13:11:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0FA191A14D2;
	Sat,  8 Aug 2026 13:10:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D83766045E;
	Sat,  8 Aug 2026 13:10:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42DD411C484B3;
	Sat,  8 Aug 2026 15:10:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786194654;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=gaBcsh29d20Vv8HUNxBNk04mJcbldcEu6BbnQ8q8Xf8=;
	b=wLe/tsGmUz8FSXP25PydvttoBGkzPvsThaIOQqQk1E1WIEWsBBz/EHg+AF1njspM16SuJG
	5rbgZnmq4hIjor/VLvYQbwYS7F5Z7Zurc/Ead7y4AaHkGC+9ygvhWw9jwYapPytV9wGU4P
	9sVroJsbJogn2PfnLAWQnOVGhBDVC4+Hv1FQtgNIF5O7C5nlnrngOlvnkODnZ/BexsABt7
	aHnUe24i3yFthJDm+d0D6hxwanuak/Nwv2jnq7xB/uLnXtaKx1cmXLEtkCHMaXNmhu3bZR
	S6EDnfuFuT8MgsbtRfnoovtxQxBB/urkVjzn8EZ98pAxLdctg3agBZie0iX0eA==
Date: Sat, 8 Aug 2026 15:10:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Akhil R <akhilrajeev@nvidia.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tze.yee.ng@altera.com
Subject: Re: [PATCH v5] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
Message-ID: <178619464541.3721483.13323020054578702831.b4-ty@b4>
References: <d789219ca0418898a1ef2bf9295b4f96ca7b4209.1785484707.git.tze.yee.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d789219ca0418898a1ef2bf9295b4f96ca7b4209.1785484707.git.tze.yee.ng@altera.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_061100_812313_3559491B 
X-CRM114-Status: UNSURE (   5.63  )
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

On Fri, 31 Jul 2026 01:01:39 -0700, tze.yee.ng@altera.com wrote:
> Implement ->set_speed() so the I3C core can switch open-drain timing for
> the first broadcast address per spec: I3C_OPEN_DRAIN_SLOW_SPEED programs
> tHIGH_INIT (200 ns) before RSTDAA, and I3C_OPEN_DRAIN_NORMAL_SPEED restores
> normal OD timing afterward. Cache the normal OD register value during bus
> init and use a separate od_hcnt for the slow path so SDR extended timing
> remains derived from the normal PP hcnt.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: dw-i3c-master: fix OD timing for first broadcast
      https://git.kernel.org/i3c/c/7315aad228c2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
