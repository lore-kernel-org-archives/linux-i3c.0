Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670F9C531CB
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Jul 2026 12:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0m0y7P2fJNaCnOoJ6icRbLx+k4S/pR/h8OsCtJfHc0=; b=yD+FM+bOuhKyNC
	pVURBOYngFw/Zgd/Tsu8SXi3HCrTfwXOgnuO+7gvch3onq2hXDoNMvTqLnoWL0jVsXBtwLlylFXVU
	bfYRYDz7bXteG9spm+OZD9qwMF8zCpmTr+lc6uo7C8z8sjc6pguDybI9/vnwEzIffbTcd4VcnMp+2
	GyaI/DZRncFfdrc+AMc66V5Dse27uKQ83qBYtla7uTx5izKSh+kRgwMc6N2fMgvib3OT6w9hoVTZy
	aK9/04Lvz0mLb9gibc6aprXWcOErlcV5X6esMeWf07+hQSfNlztylHNac++bvW0Aog6fCqj4/aJAB
	JH6KVA1NukEIhTXD0uTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsa5-0000000EF1a-3krj;
	Thu, 23 Jul 2026 12:31:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsa4-0000000EF1D-2RGO
	for linux-i3c@lists.infradead.org;
	Thu, 23 Jul 2026 12:31:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A6EE7600B1;
	Thu, 23 Jul 2026 12:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF031F000E9;
	Thu, 23 Jul 2026 12:31:12 +0000 (UTC)
Date: Thu, 23 Jul 2026 13:31:08 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v14 0/8] Add support for NXP P3H2x4x I3C hub driver
Message-ID: <20260723123108.GH3363113@google.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
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

On Tue, 14 Jul 2026, Lakshay Piplani wrote:

> This is an MFD driver integrating I3C hub and on-die regulators.
> 
> The series introduces:
> - Core I3C master enhancements required for hub support
> - Generic I3C hub framework
> - MFD driver with regulator and I3C hub child drivers for the P3H2x4x I3C hub
> 
> Below patches from v11 have already been applied to i3c/next branch:
>  - 79c41666b397 ("i3c: master: rename i3c_master_reattach_i3c_dev() to *_locked")
>    https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git/commit/?id=79c41666b397
>  - 8d8afa428318 ("i3c: master: Expose the APIs to support I3C hub")
>    https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git/commit/?id=8d8afa428318

Am I correct in thinking that the only deps are between the Regulator
and MFD drivers?

-- 
Lee Jones

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
