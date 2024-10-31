Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13665E6748C
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Oct 2024 23:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRmZGLSiTUcxbxShL1vEm7xCfNICOvlh+zDrf8ISiyQ=; b=RQVNsFylyVpjcB
	ypln2aqvTUuKYP6HmhO6aZi+Z/df0EzybeADJRFL8xtfBxQGcUQWC1qI7a7rziwTMu/ncAVcdRZFf
	hznpbKERbaEmapoS2QXKluUqT5FWRO7YcyaYJ1uCgHTmwDbSRYKGvbWL/B+A/HCeut2ciIimfgwm0
	T7VMqg9SbNPD7Rpc/ZCHhe1X+WNIWKxB7XVxkitzRPKwXatmnvlIfbNpJSznmFLfp43u03OzCyFj3
	zPJBHLVO0bXhDCCtGWEZPlfM6c8JIVqTCHH2aHiqAKZ3SmwlULhemIr7BKWSNJK8T9PDom7zMgEom
	N+wrxSiq1MHl7FoDeleQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6eFR-000000058Ph-2sWj;
	Thu, 31 Oct 2024 23:06:37 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6eFO-000000058Nu-2QlS
	for linux-i3c@lists.infradead.org;
	Thu, 31 Oct 2024 23:06:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 638E760002;
	Thu, 31 Oct 2024 23:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730415992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ry2WSYMK5y9Zn7M41+EZmFYmpaH4VgZk1Siq5qyOAxw=;
	b=KX6kDf8Bmw6+nLTuTwSsPhYwHsEvfM86IKBpf2j+lfF5pPMLL/9NfVUTVF42CJkX9he96X
	S7+giYjbnKkiHk0TnwxUdJW3WXZoWPIE5uaOT7HO96mFvLWVelG6NMS7Y62GChFp/gLMj6
	WbyQZqD6w4xcDtBgfnhPjSpjgARcppdbI2aURfXS5h19FlRkfWOGDi10HEpnZg//E5VYVl
	Sr1TrTXGU+BaGNvPgza1NC47oreWOY795PTm/1HmBy840/Gr56NYkaMqTTlOJgyhQID6G7
	7tP2N98C9z80BLjt+mhAy/2IqiShge3uJ/oQywYPpHvASlKp1axho8alWnXR1Q==
Date: Fri, 1 Nov 2024 00:06:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>
Subject: Re: [PATCH 0/2] i3c: mipi-i3c-hci: DMA interrupt fixes
Message-ID: <173041598428.2393228.2119713976915178263.b4-ty@bootlin.com>
References: <20240920144432.62370-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920144432.62370-1-jarkko.nikula@linux.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_160634_781112_D1FE60FE 
X-CRM114-Status: UNSURE (   7.57  )
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

On Fri, 20 Sep 2024 17:44:30 +0300, Jarkko Nikula wrote:
> These are targeted for the v6.13 cycle, i.e for the i3c/next branch
> after v6.12-rc1 is tagged.
> 
> Patch 1/2 is stable looking material but I think it gets visible only
> after patch 2/2 on a MIPI I3C HCI v1.0+ compatible HW so in my opinnion
> should go through normal development cycle.
> 
> [...]

Applied, thanks!

[1/2] i3c: mipi-i3c-hci: Mask ring interrupts before ring stop request
      https://git.kernel.org/abelloni/c/6ca2738174e4
[2/2] i3c: mipi-i3c-hci: Handle interrupts according to current specifications
      https://git.kernel.org/abelloni/c/45357c9b37bb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
