Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F66EB64DA
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Jul 2023 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39I8Xu3G0n38tCjwDv/FhgNON8PANoiJDFWDBv7xlQk=; b=vRXYO9NBVbGWrJ
	yMxFwOkBOHJKdfMcegQcdPEatry2qmd750TyEV/qgvBZ9d5JnTRoNxuZ3dTgAgFeWSGm561i5jlXr
	IH7eyjgPPGAD1WuTozjmwMuJsV6VinBMGEWZmfUPav8FLNbs2DkT8P6lBEbv5te2lhXUfOU+WK0RT
	5OCQbmCU0r1dYsv5BpYWG3HWqNbS4Rs0fOY4tgIzyBunI8GgmnRrpRpChUFE0yP48ERwXo6In6dBu
	b9quiOWU5IchuDJBgoHdNIV48+BXc4BNCJQ2WQ7iAE0ofiFlx7veCao0M91spuJteWiicBgS+mYPz
	/uCaMkOZCmMUHEUL3UjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM3DZ-006Vo4-30;
	Wed, 19 Jul 2023 09:11:33 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM3DX-006VnG-2w
	for linux-i3c@lists.infradead.org;
	Wed, 19 Jul 2023 09:11:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB0A0FF818;
	Wed, 19 Jul 2023 09:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689757886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f84nkPfrwMn/3eLaRQd5GjJzAg3jngCL9dYTvmRIvUM=;
	b=SU0jjGdxGPP52Yam69nVPKd4b+CELuc8c4p3sBoKg8RwSfP/glbAzBoHYe6/mTdIXBnt1B
	4VJ1m0r0N9jbxhj8yaLA9jD20i/VuimYyWfnCMjWC/zihQRDf30ZduDGPGqo2+vDvb1C4V
	Yzj9URJhovfQN70377Ozg2DK/P5v2v3vLKoPbnNFn0tM0bP50qoBt8r+gRlMbhYCvMVTbW
	WFW++2LtntTbpl1hX01ux2j/Rr/0MgF4YknQqOt33IAuAJfWbjzk+I5gXTHUFImtDzvsMi
	7jYXmLAJ+qLOb9V+h4uX2HPVZu7krJSDT+PZ9nQ6Ou1qO2J8YVOggWJgc1B9Ew==
Date: Wed, 19 Jul 2023 11:11:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Matt Johnston <matt@codeconstruct.com.au>,
	linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Jeremy Kerr <jk@codeconstruct.com.au>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next v2 2/3] i3c: Add support for bus enumeration &
 notification
Message-ID: <2023071909112418ec7fdc@mail.local>
References: <20230717040638.1292536-1-matt@codeconstruct.com.au>
 <20230717040638.1292536-3-matt@codeconstruct.com.au>
 <20230718185757.54ae1e2e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718185757.54ae1e2e@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_021132_091700_10DFDB97 
X-CRM114-Status: GOOD (  14.34  )
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

On 18/07/2023 18:57:57-0700, Jakub Kicinski wrote:
> On Mon, 17 Jul 2023 12:06:37 +0800 Matt Johnston wrote:
> > From: Jeremy Kerr <jk@codeconstruct.com.au>
> > 
> > This allows other drivers to be notified when new i3c busses are
> > attached, referring to a whole i3c bus as opposed to individual
> > devices.
> > 
> > Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> > Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
> 
> We need one of:
>  - sign-off from Alexandre that he's okay with this code going via
>    netdev; or
>  - stable branch from Alexandre based on an upstream -rc tag which 
>    we can pull into net-next; or
>  - wait until 6.6 merge window for the change to propagate.
> Until then we can't do much on our end, so I'll mark the patches as
> deferred from netdev perspective.

I'm fine with the series going through netdev. Matt, please carry my ack
on the next versions.

> -- 
> pw-bot: defer

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
