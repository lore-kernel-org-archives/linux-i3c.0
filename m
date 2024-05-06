Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55C0C4345F
	for <linux-i3c@archiver.kernel.org>; Mon,  6 May 2024 05:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2iipjD+0860hVTlQhJJbCd9WYKCME/3UyES/o/Iu0o=; b=xqgkP7GvOvtGyu
	MUsylOCzjhWqbWtM9V6UKXkslKKiUjiYBVPfvwU5jSvwkLQYYcofbE0OT2nHBUcpAMh4BqOVa259C
	Zio6rlgbmeb4Hsp3SwOwxGBFzPGqyQdHuarU3wkStNQrV2zh8FnymMMzECTKJs2j8lFhQZjxuKAOc
	MKCkEJIdLC43A8pNEEX+H9hL/iO/KLJEpCv4D/RDqylM3urQDrpS63ArRFp9bsKvs8o67FfwcrTpG
	z16f/C1TUXFOUPIvMwEUL4uieKpR4iDLw8VOs/TIztNWJqoqpUne+3sGSG3PwBQHGLa1FQHEPzk5q
	5ookY9n01sfGonozn/2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3qbu-000000065oI-2zHI;
	Mon, 06 May 2024 05:09:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3qbq-000000065l1-18Si
	for linux-i3c@lists.infradead.org;
	Mon, 06 May 2024 05:09:56 +0000
Received: from [192.168.2.60] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5B3392009E;
	Mon,  6 May 2024 13:09:37 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714972183;
	bh=6T7f2QduS96nnM7wx4ZuNCcwzMht+bTEOjYv39h4ZtY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=H3qdPEr0OVLyCxs5buMC/BZLtXLl2w770b1tXXvIfFkt4azNnrBzwywkx8+5LeLh0
	 +eopC3rlLdUDeZCkoovso/vdj97Vr85bya03hdAffcup+tP1vwdWt1X8607yyorDU7
	 JUdOM4DLJFATFqnYtVWxXnyzxnzb7v/38zGa1fZlT+/hBXnZFZ3XXIfvjUBB+5/MOw
	 BZd6oGlqze270a4B2j/x+SDc0P6c5GQEapWxhhuUyioIn+daQxZFrTzQEwLBS9lYNe
	 XyXjx/Vm+oY3Wv1o0q5/NmofLaDr/FJDi3mrPSQ0napoSB/AJgYC8glqBhewZrX/eE
	 GZKSeWRm00IcA==
Message-ID: <645d4f645b1296d54573c4fe734768adab160035.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i3c: dw: Disable IBI IRQ depends on hot-join and SIR
 enabling
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "joel@jms.id.au" <joel@jms.id.au>, 
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "gustavoars@kernel.org" <gustavoars@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "zenghuchen@google.com" <zenghuchen@google.com>,
 "matt@codeconstruct.com.au" <matt@codeconstruct.com.au>, 
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Date: Mon, 06 May 2024 13:09:35 +0800
In-Reply-To: <TYZPR06MB65675E5D43EE265DD702E5689C182@TYZPR06MB6567.apcprd06.prod.outlook.com>
References: <20240119054547.983693-1-dylan_hung@aspeedtech.com>
	 <563ad5613e9c5f0671e1f49f2d9ba71d8735799b.camel@codeconstruct.com.au>
	 <TYZPR06MB65675E5D43EE265DD702E5689C182@TYZPR06MB6567.apcprd06.prod.outlook.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_220954_702484_7E012BF0 
X-CRM114-Status: GOOD (  14.33  )
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

Hi Dylan,

Thanks for the response! I have a couple of follow-up things though:

> > My interpretation of this change is that we keep the "global" IBI irq enabled if
> > hot-join-nack is set (ie, always, because we don't support hot join, and
> > configure the hardware to nack all hot join requests).
> > 
> I would like to clarify the control logic, incorporating the principle
> of disabling the SIR interrupt signal:
> 
> Case 1:
> When `DEV_CTRL_HOT_JOIN_NACK` is set, indicating `hj_rejected` is
> true, it signifies the controller's non-receptiveness to the hot-join
> event. Consequently, we can safely disable the SIR interrupt signal if
> none of the target devices request SIR (reg == 0xffffffff).
> 
> Case 2:
> When `DEV_CTRL_HOT_JOIN_NACK` is unset, indicating `hj_rejected` is
> false, this indicates the controller's readiness to engage with the
> hot-join event. Therefore, it's imperative to keep the SIR interrupt
> signal enabled, even if not all target devices request SIR. In this
> case, `global` is false and `enable` is false.

Yep, I see what you're doing there, but it looks like the correct state
would never be set if we're not enabling/disabling the IBIs separately;
with this code, we would only ever enable the SIR for the HJ if we
*also* happen to enable IBIs.

The initial state would be to have all SIRs masked.

> Billy recently submitted a change to implement the hot-join enabling/disabling. Therefore, it is timely to consider the hot-join functionality.
> https://patchwork.kernel.org/project/linux-i3c/patch/20240429073624.256830-1-billy_tsai@aspeedtech.com/

Yep, I saw that, excellent! It's next on my list to take a look at.

It's just a little unusual that we're enabling the HJ interrupt before
actually having the HJ support though.

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
