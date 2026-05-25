Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E560CD5BB1
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dfwc+WUsBAoYDkC/NLzd97udI1fYwHz5VjC60NuR6RE=; b=yRPzcNSL2iYz4R
	8e3rTgmQyxCDxn0VWf8MJDaMKkyLNcy4KyYelSUvesxJZ4SgpwuXmERLNVXlgosBCFXLOaE4bzm7r
	QbPRpxNtOaqX3AQ2CcJsUtWaCKnP5wTxrrwwBcQMXXvTYTGvnF7+wRD/gzW9IR4jY5h/7EIJb9T9n
	p3gAIl4NjV9Hl+RSdKW4DBcPwT/UZ3Rbe3OYjCP0yJEobrFOhQtueb0L+rO7X7DegHoMN/mLEcxJS
	mQbJZXaBUZ7YYu6s4C3ozh3dv4wo88d+CmpUIUeEXlUaLccbwN1/aP7sj4+QaNQO/Glq6FDU54mXt
	8N7Av9gyZ8LFU9OPRjaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVr2-0000000HMvq-1gt1;
	Mon, 25 May 2026 14:00:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVr1-0000000HMva-2gjE
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 14:00:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B5E94600BB;
	Mon, 25 May 2026 14:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166AF1F000E9;
	Mon, 25 May 2026 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779717626;
	bh=g5oYXv2b6VWLtIK2iS3P4ZRH+VT0xnxpOXO2zb2Mwn4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=X0/xnwk/nDGlpyNWKtOfNmiJlNNFYI7lNsr2OxC2holR3uVFyOXpIzD/pOU2QG6iB
	 DVIWOwQNE/PJ5hwhf7Rnq1WBaiDvzalPiCEEO/RZP3bpAj4TDh+RyoNetC5z+sF9tG
	 O16YZHQ3oHVoybQKKEPOaJNPX0f6hO9zoRVGlQyInOhYtR1giRXfGDB33PJZq5uigG
	 uTPzejogswCFHFzWlK9zmWjOooJJ1CcZmUdAWNQM73vcXqdVR/Mz4AfdnoZj/guLIS
	 jH9ZGnFRcXxH6a5JsNEbe2oRXTlnB589NSj5J6nZTPfFchbOuBX4VJVmrA/APrMV70
	 pBnkJgRHbtMAQ==
Message-ID: <c38c3c96-a775-45a9-b2e0-64ed5d0a49d4@kernel.org>
Date: Mon, 25 May 2026 16:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] staging: i3c: add Realtek RTS490x I3C HUB driver
To: zain_zhou@realsil.com.cn, linux-staging@lists.linux.dev,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, alexandre.belloni@bootlin.com,
 Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, wei_wang@realsil.com.cn
References: <20260525125128.297-1-zain_zhou@realsil.com.cn>
 <20260525125128.297-2-zain_zhou@realsil.com.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260525125128.297-2-zain_zhou@realsil.com.cn>
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

On 25/05/2026 14:51, zain_zhou@realsil.com.cn wrote:
> From: Yin Zhou <zain_zhou@realsil.com.cn>
> 
> Add driver for Realtek RTS490x series I3C HUB devices.
> 
> The driver supports:
>   - Device Tree based configuration of LDO, pull-up, IO strength
>     and per-port mode (I3C/SMBus/GPIO/disabled)
>   - Logical I3C bus registration per target port
>   - SMBus agent functionality with IBI and polling modes
>   - GPIO chip with IRQ support
>   - DebugFS interface for register access and DT config inspection
>   - IBI (In-Band Interrupt) handling
> 
> The driver is placed in staging as it has known issues to be resolved
> before mainlining; see drivers/staging/rts490x/TODO for details.
> 
> Signed-off-by: Yin Zhou <zain_zhou@realsil.com.cn>
> 
> Changes in v2:
> - Update driver to match v2 DT binding: parse physical values
>   directly via of_property_read_bool/u32; drop string enum lookup
>   tables; update property names with realtek, prefix and unit suffixes
> - Fix maintainer name; move MAINTAINERS entry to driver patch
> - Code style: rename TPn_* macros to TPN_*; rename SMBus frequency
>   constants to UPPER_CASE; add mutex field comments
> ---
>  MAINTAINERS                                |    6 +
>  drivers/staging/Kconfig                    |    2 +
>  drivers/staging/Makefile                   |    1 +
>  drivers/staging/rts490x/Kconfig            |   16 +
>  drivers/staging/rts490x/Makefile           |    2 +
>  drivers/staging/rts490x/TODO               |   35 +

So this is staging driver? Then why do you send us bindings? We don't
need them. You must follow staging rules then.

Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
