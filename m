Return-Path: <SRS0=AFd6=JV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742E2C43461
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:15:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30AC061158
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30AC061158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qKY+nBCpJQ6+f2ZP3XGK6VZW/Yi60IRz0NYfupFh2qo=; b=CyfnjHDMm3U2x3XB2NDKY2QE5
	5t2vVuw8qBkWsJlNUb9jObtVlKYJY4L4ZIaQaPn/4LdE5ehN7gqhDzot17qSjZM/cUSrV6BdwJyeY
	gsCEqq/sK+lDehYypbjmCPg3QILPsr9+KDzzquxFs9yXEiL26tDXKJEMwZa3hp5DfLzSvXb1c4184
	IwqfHipJqH40acjHKpoABkrxOWFM+ObTQkGbvu/KzoN6knFsi19t+CyHRn4w8mpSBKSaKR87gtvBB
	CkSdPZ0oif0mr9dwfWuriTViZXC3DBJVJ31UdpA6mOn0Jb8lRuLGt0Xttofc1lazlwVpOCXwmIaOT
	5NNnn5oAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laOgn-004MtY-6E; Sat, 24 Apr 2021 20:15:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMT27-002uaR-VQ
 for linux-i3c@lists.infradead.org; Wed, 17 Mar 2021 10:04:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1EF864E27;
 Wed, 17 Mar 2021 10:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615975445;
 bh=QDZydGcTtHUis2/3WI6dsm0emvhCUjMzugPN7PcCtDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bYjK9BFrFu5veHYn+z3996REW08FGcefktVWTLQ0WVQUUrfXMTLwcQRUs/m6a0DDB
 hso+VFUpSJg/0lfbrggyogvyszOPF9moCtRRTZudOFOkzbsTg36KlZu/c7ASIFlpPi
 Vkv+k1SJa77oudShQm9Mbvr5QKhtEPaJOYe8eUDeRbsGzCc2chANbvEM5hMd4EPWcZ
 8YQcU7G8prgVocfLMlzqOMs0E5+EY9U956S2qq/WOuunVV16bbj58o0E6qjkG0HqGz
 sixx+pKf3WXbwLrl6CGLVhtRSdtVt/r9qdHMb1T74TrrDSzaZy6fbTPEzj1ho7JTQ6
 rs5Xy7ynHuoVg==
Date: Wed, 17 Mar 2021 15:34:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Clean-up undocumented compatible strings
Message-ID: <YFHUEVk/F0zoTe7c@vkoul-mobl.Dlink>
References: <20210316194918.3528417-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316194918.3528417-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_100408_445394_FBC191F0 
X-CRM114-Status: UNSURE (   5.45  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sat, 24 Apr 2021 21:15:23 +0100
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

On 16-03-21, 13:49, Rob Herring wrote:

> ---
>  .../clock/allwinner,sun4i-a10-pll1-clk.yaml   |  2 +-
>  .../bindings/clock/milbeaut-clock.yaml        | 12 +++++----
>  .../bindings/display/brcm,bcm2835-dsi0.yaml   |  6 -----
>  .../bindings/display/panel/panel-dpi.yaml     |  2 +-
>  .../devicetree/bindings/dma/qcom,gpi.yaml     |  2 +-

...

>  .../bindings/phy/ti,phy-j721e-wiz.yaml        |  2 +-

Acked-By: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
