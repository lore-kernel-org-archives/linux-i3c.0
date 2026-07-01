Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9530CC43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 18:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wwBRDVT4dSlr1IcmDTfgDMed+9DO4vRNnj2kZcF8iM4=; b=usVrMOjp3VDosD
	HGjaXBPxA/gV8MY7Zb1vWMfkoQ2Dm3YAfG1twc7mtuHO9WcF1Qgg2bBHCv0nUGhkhWcqg0iLd+sO9
	rygFZdKk/uWcAlYDo3k7tWiHq6HLcnwyphoYi3Ij8IKgc/2MxMWdw+oF2iVL6qX59Z/3N/pEVPHAm
	X+0P4gZ/lglXFvjymG9P4V5Xa/6pS3NYA9pKFrJ4IVZ5akq/wpiBxaX8a5oKJhtBjZagXzUSHPGSD
	iv3yaNJFVVawnV9+NsptsxSz0geWt/hy4oKniqyPq1yKbeOa8yRq+TF4lk/6HvYmByQR/f07GxHr0
	6P/hbu0m+83uNgWvmvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wezhu-00000002pdm-1YFC;
	Wed, 01 Jul 2026 18:30:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wezht-00000002pdW-1Oi0
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 18:30:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0A954178B;
	Wed,  1 Jul 2026 18:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3E11F000E9;
	Wed,  1 Jul 2026 18:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782930644;
	bh=foHfZNtLG3LQ3q0ZQYscRSqjvuuHtzmA6Utg0IVzlM8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EHSfSyt3yIlNKmMiyeX0LwlKtZGWggpPzBoa5BmAd204CPmVP2i/mXUaW1zLVaHMr
	 5Bp/2pUgJB4xWd6a+sLyttnMpAzlj3rqp1xsSXJrKRYzTif7OxAD51FL4tzO3ESHhy
	 /+GeT/hUW/EoqORTyevIGRI/bxayx4hlboQOA9Juw48bsfLhsgW1LeLXHQN0eDELI1
	 3rtXZpT5oB5B2j51fTuPHDos6vLZeqVzjo9BlQOg74iJ0+zMa5K48FrP3FLzw9bX8D
	 qze0feBsnmPkIqOIQSTnJ/sJTWmb+tGACTGz+lRcuwHyuOS5Zz16ZfeZrLxQg3gSxv
	 MrVJT+8AIoO9Q==
Date: Wed, 1 Jul 2026 11:30:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
 Frank.Li@nxp.com, adrianhoyin.ng@altera.com, ustc.gu@gmail.com,
 bbrezillon@kernel.org, vitor.soares@synopsys.com
Subject: Re: [PATCH v2] i3c: dw: avoid shift-out-of-bounds when DAA assigns
 no devices
Message-ID: <20260701113043.726e0e86@kernel.org>
In-Reply-To: <akVcAZzT-WGHZNWp@lizhi-Precision-Tower-5810>
References: <20260630172904.2662160-1-kuba@kernel.org>
	<akVcAZzT-WGHZNWp@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
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

On Wed, 1 Jul 2026 14:27:13 -0400 Frank Li wrote:
> On Tue, Jun 30, 2026 at 10:29:04AM -0700, Jakub Kicinski wrote:
> > On an empty bus ENTDAA assigns nothing, so cmd->rx_len (the count
> > of addresses left unassigned) equals master->maxdevs.
> >
> > The GENMASK() index master->maxdevs - cmd->rx_len - 1 then becomes -1,
> > which trips up UBSAN. This happens every time on boot on a Gigabyte/AMD
> > server:
> >
> >     UBSAN: shift-out-of-bounds in drivers/i3c/master/dw-i3c-master.c:905:12
> >     shift exponent 64 is too large for 64-bit type 'long unsigned int'
> >     CPU: 7 UID: 0 PID: 963 Comm: (udev-worker) Not tainted 7.0.11-200.fc44.x86_64 #1 PREEMPT(lazy)
> >     Hardware name: Giga Computing E163-Z34-AAH1-000/MZ33-DC1-000, BIOS R32_F45 04/01/2026
> >     Call Trace:
> >      <TASK>
> >      dump_stack_lvl+0x5d/0x80
> >      ubsan_epilogue+0x5/0x2b
> >      __ubsan_handle_shift_out_of_bounds.cold+0xd7/0x1ab
> >      dw_i3c_master_daa.cold+0x1b/0x96 [dw_i3c_master]
> >      i3c_master_do_daa_ext.part.0+0x3e/0xf0 [i3c]
> >
> > Skip the mask when no new device was assigned.
> >
> > Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
> > Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> > ---  
> Next time add change log here.

My bad, I guess slipped my mind since there were no changes of any real
significance :/

v2:
 - whitespace changes
 - s/We see this/This happens/ in the commit message
v1: https://lore.kernel.org/20260629233650.2148827-1-kuba@kernel.org/

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
