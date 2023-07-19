Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7E0EB64DA
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Jul 2023 06:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJZETkEQjlGXCzoMRApYPt997BZArq5t4v0nCDCi48Q=; b=aS8v+H5n/JUdgP
	sJOYfxtR2ROMU4VZXTzLKbRwGoMehmPRaumfOqJJP4Re+Vj08NLF55KT+m+qBNXVgLKzGQ3RdSiZZ
	6r6S6gFsiedXGl9CYW0ZLPM8puuBGTxPMVDu3VLsiP8rG3KLx59nc5tInl+MnE9ZaqSQ5t1DPnj+o
	uHo8Fhx7QgIIZ3xDPHV7K82EWXicU7JYdYTCCfhb1sDfOd29qYw3/W8nAiBOYBS6xDwlk4KaIcM83
	aLqzQAy9SgG+iHAIZaaVOkeqgagyG0y+axG2aV4Hcy46zf2PEHlVuI1+aKY0x2ufoTkUZ0t+MfodF
	r0qevIeKO+Hm6WPEn2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM15z-005yVj-32;
	Wed, 19 Jul 2023 06:55:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM15y-005yTx-0O
	for linux-i3c@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mVK7oe6re3Uet3jafuqigwW3EtcdCOOHCSSFipOroZE=; b=TA3oUU25JPuOeqNQeHyJTgPzVf
	kSGeq23Kx8bIzEnaEdF7VndL1TDiq89WzUN6ZEGnGbjF1gltJ3JJaFOKQG/255fU4bdAmktB4qFfM
	y0ku9PvbgGhjCfCQKg+e5B7EABS1DbumYsVoPeDBPQbaFyOzz2EgbRPrdxr8KNPDR8srwMVsWwbiU
	BA1kLUB4zMHo+0Rps60wwfdkE9pTKYznBmpgSvQt0QsQWl19T5LNMN8dE4/utT84UIV9aDFFM8ysL
	p5QhZP0AEAz3NdI+bFI/c0k19K4HCY/JJAjMSx3B41pd+gHogi4JdwCSiTfY34dvTcJWLCPFB3n8H
	tUCMCxuw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLwS3-00CRQH-2f
	for linux-i3c@lists.infradead.org;
	Wed, 19 Jul 2023 01:58:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D48D615A3;
	Wed, 19 Jul 2023 01:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC42C433CA;
	Wed, 19 Jul 2023 01:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689731879;
	bh=xV4j/eBSUiPaOF7DNsEID37wgewGDwpgj3ghPv/Zm/U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g0VPnIN4OQMOP/yQfplfNBA0rJg6b8htqfMDtdUBF09MYsRYcPn04mN6eXxVjuNXO
	 VBHpAi48n/HmTodyw/klN1lxdXcwZDF1IWiPVDbLj0SU4jClz3oSeVpS8ayhPLUljz
	 PoVkRACbH2xPYyaaCKlY8OzIrS8ptIoypne1yrAV/Shh5OfFGisblITgSY3n5lwuqE
	 4zRT0LOzXjzSXMrxV+d9uNX/8MBlTTjo9fPwdrzhPnFPZcE5qbO3DWOEZM7k9+3BDo
	 BT5yBHPHJOfKKwGlOJO0F6nudsW2OBjnGY/TQxPKRQk4XYWufsV9pGvLAoRhNZgUgG
	 U6ctsq6HATZjA==
Date: Tue, 18 Jul 2023 18:57:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, Jeremy Kerr <jk@codeconstruct.com.au>, "David
 S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next v2 2/3] i3c: Add support for bus enumeration &
 notification
Message-ID: <20230718185757.54ae1e2e@kernel.org>
In-Reply-To: <20230717040638.1292536-3-matt@codeconstruct.com.au>
References: <20230717040638.1292536-1-matt@codeconstruct.com.au>
	<20230717040638.1292536-3-matt@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_025804_842521_B4C86DB2 
X-CRM114-Status: GOOD (  10.70  )
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

On Mon, 17 Jul 2023 12:06:37 +0800 Matt Johnston wrote:
> From: Jeremy Kerr <jk@codeconstruct.com.au>
> 
> This allows other drivers to be notified when new i3c busses are
> attached, referring to a whole i3c bus as opposed to individual
> devices.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>

We need one of:
 - sign-off from Alexandre that he's okay with this code going via
   netdev; or
 - stable branch from Alexandre based on an upstream -rc tag which 
   we can pull into net-next; or
 - wait until 6.6 merge window for the change to propagate.
Until then we can't do much on our end, so I'll mark the patches as
deferred from netdev perspective.
-- 
pw-bot: defer

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
