Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF16DCA5FC5
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Sep 2026 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNqLHP3iAk4dfE2+2zqUY0QIx2L1pjOXGNUSelFxzeU=; b=150CPUmfkQaH9r
	8WOTiJPf//+sUEDUG7ySZl98atZnzOD2dbWUZ9huHuVP9F7smR6n2taRYTXSmUkwOzhs7LDFbVkwH
	iwC57TGRdfd6WSOlW0O47WTv4d6H3e6nGVlYx7Yn5x9bbqW2ZgJaSFDmCfBkUWI95Vuxpo8UCZHkU
	swyEsaNfAuXgvMdFKXkA/nAGg5K8HiirQ+mC104r2Zj+QZol0sKmdYfrfqEc7Fn04W7shO6viGynE
	wE9lwxXIoI8kmRI9ouKwAqvyg9jNj4Eg2eN26LX2uuh0eyFUGyyYUyREe/aDY4NuSYVJ0MygKLWtN
	tBULMyGSG530pTgSQGgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvDb-00000006J7T-1DCf;
	Wed, 30 Sep 2026 14:23:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvDP-00000006J5D-1EGd
	for linux-i3c@lists.infradead.org;
	Wed, 30 Sep 2026 14:23:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 01CA41A106C;
	Wed, 30 Sep 2026 14:23:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C118D60749;
	Wed, 30 Sep 2026 14:23:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB4281032985F;
	Wed, 30 Sep 2026 16:23:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790778199; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=tNMw6NTjdJJ4qvs+O1OY9kSbqUjNQiZ3YyQVzxT+H8w=;
	b=QQ/Eq8uzh585JpJaXZ/L5B092QPaVtVG8QFNzjpNW7he9bQzz/Ve186eUQO1GLn0FOHDrg
	Mmqc3pTZYncNf0mWxZAsq2pruquvUFtrh18XcEvJehZDZ01WvP7znOZ4mCuLzjK/M+3eDr
	XE3Lcl0SC+tFfsm6Yd0+Zb8Fl986BKm/rW5lpdg2CuN0F2LQN+ZNtrs6Lp9HocgvXtfDea
	LXdl8BjIGgvWqf5qz6Hhq0Vs2+sE9NK39I9XLbq1gjDMxjmZkHZaZv8dc5MA3jyATR4aKV
	eghGk/fTgRzdeaClX6S90gXglzyykmdPBeypLVHzFOUVvw2NwwFgW1UAcq3tjw==
Date: Wed, 30 Sep 2026 16:23:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, mfd@lists.linux.dev,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: vikash.bansal@nxp.com, priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: (subset) [PATCH v20 0/8] Add support for NXP P3H2x4x I3C hub
 driver
Message-ID: <179077818367.407330.1583527335918259957.b4-ty@b4>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_072325_512754_2D8813F6 
X-CRM114-Status: UNSURE (   8.35  )
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

On Tue, 22 Sep 2026 16:05:42 +0530, Lakshay Piplani wrote:
> This series adds support for the NXP P3H2x4x family of multi-port I3C
> hub devices, including their on-die regulators and downstream I3C/SMBus
> target ports.
> 
> The series introduces:
> - Core I3C master enhancements required for hub support
> - Generic I3C hub framework
> - MFD driver with regulator and I3C hub child drivers for the P3H2x4x I3C hub
> 
> [...]

Applied, thanks!

[1/8] i3c: master: Add APIs for I3C hub support
      https://git.kernel.org/i3c/c/9d60a0eafae1
[2/8] i3c: master: Add controller-only device operation helpers
      https://git.kernel.org/i3c/c/8d0008260c32
[3/8] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
      https://git.kernel.org/i3c/c/58c018414635
[6/8] i3c: hub: Add support for the I3C interface in the I3C hub
      https://git.kernel.org/i3c/c/b0cfe49a2e3b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
