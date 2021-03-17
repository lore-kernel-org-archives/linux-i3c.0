Return-Path: <SRS0=Ixk3=IP=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2153C433E0
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Mar 2021 05:56:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81B2864F92
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Mar 2021 05:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81B2864F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xU2+31d2z68/JUicZs7NsJy3sjatRrK041baawC+mZ4=; b=P3qoeHfuf8oczDjVwrzF/8bbU
	1dkldE+zHVue/cFq29eY4WSgmDdr3cYxi7hFiIZpCLoWdTdeV4i9kkjdII4N7roCmgblxeddKRZiM
	HlMvEbXvHxyYX0vT3qReKadZYBiHX7Q/OrNx5v1vtXmUlCfFH4n9komySVgz5TpGNDpOBpoqn+I8F
	/9UmQJC8goT8sd1d9pArhBwbULz2c8duHyZImccCBPCHvXG4bzXE7CVqAMkqcdgqT2Dlnwvv7mP2t
	JqIkFGlI5Uxv3mQjk95r5oO9E8R1vszxxvqvzravvQnC9KpSvH4Q2UW/c/rsNrTnw/3t2S90ohfhL
	zbAFoTpKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMP9z-002Vyt-TX; Wed, 17 Mar 2021 05:56:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMP9v-002VyH-UA
 for linux-i3c@lists.infradead.org; Wed, 17 Mar 2021 05:55:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 822F464F8B;
 Wed, 17 Mar 2021 05:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615960554;
 bh=Uw2XR+KFoqF44PVTyFewSL9xW7snb+4K3fw3fuSjnvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m27XvL8TxF9jhV2YY0futtPmw28Pe+73gg3r1i6uzIChvm/IUeblmGr8HUXw7/i4e
 cVM+apyehxlcs7BE+4gtXSg1VqhZWwue9KVObKsqlOxXvWzWdihUegkfAwsNpshvBG
 OpiPNqStHfdyNNIsqf5Qd8cpDOpFuI3ak+Pd0M6M=
Date: Wed, 17 Mar 2021 06:55:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Vinod Koul <vkoul@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Clean-up undocumented compatible strings
Message-ID: <YFGZ5zsh5zWQXBU6@kroah.com>
References: <20210316194918.3528417-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316194918.3528417-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_055556_227872_EFFEC15C 
X-CRM114-Status: UNSURE (   8.99  )
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

On Tue, Mar 16, 2021 at 01:49:18PM -0600, Rob Herring wrote:
> Adding checks for undocumented compatible strings reveals a bunch of
> warnings in the DT binding examples. Fix the cases which are typos, just
> a mismatch between the schema and the example, or aren't documented at all.
> In a couple of cases, fixing the compatible revealed some schema errors
> which are fixed.
> 
> There's a bunch of others remaining after this which have bindings, but
> those aren't converted to schema yet.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-clk@vger.kernel.org
> Cc: dmaengine@vger.kernel.org
> Cc: linux-i3c@lists.infradead.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
