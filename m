Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA236606A31E
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Nov 2026 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H8f0xP1k;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=VXI9HqEE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8RU3yn3reZFzxDkZW1rsCiAQ9EWXsGGIcckJnzVmYm8=; b=H8f0xP1kO92+JvMcvmFlN+UYth
	aQPTSwI33t5MJAezJGZ7DCgfyFmiC6lREp/A7FnHBsDr9KXgf5q5/DE0dtaev/2z4RgJRBvuxjYOg
	NZoAJpCad2TLFK7qifhOql0ahavkSzzOfw+qCo6YEJnTYG4p7UaKq06Yf4uIh2mSk1HxMjCvGKTzi
	u65Wo7ktK6Wz4ZYOm+yKj6Uf7YFfH3iPpETOMDkDJ/VFQy5as1WyFNMTVRq2mayWJdcSy5ElAzk1a
	DknSO0ea06LIaUuMRmMenSh+2EltzJ0nl62Z/LNwjgA14Fyq+R9tx0DRKhtJbV7mRz4mdxJta+6Ba
	8+ij7cDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs06-0000000FO8P-1ojL;
	Fri, 27 Nov 2026 09:12:14 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs03-0000000FO47-1pV8
	for linux-i3c@lists.infradead.org;
	Fri, 27 Nov 2026 09:12:13 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so8174551a12.0
        for <linux-i3c@lists.infradead.org>; Fri, 27 Nov 2026 01:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795770729; x=1796375529; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BmBlqkLTRWPnM/PyPREkTVAoRCehz9jfOuEcWz3kOo=;
        b=VXI9HqEE9QfXDTQqAyUf/GnAQ2J/bF2et9V7Equ/4Ms5T/vZ2m2NHoKysWNWWan/52
         8iLDw9p3WyY+//x5IqaanJDGhli0KsKHrw6yZNRTMjnbr8EIhiz+4MOXLLAjP8fJPRKa
         +5tN3Zpjghir7F8rZ7IiPs+Cek7kz3f1OpdKptPvPiV2lFsKGqYPgWncbBp/piz4FsW/
         Ltq9DXWNATDD1LJjiacokCS8jq8UWr5Wvop9u1ROBZwa6iAU4jzmmGhsTxyLkZ45Kf5L
         cfO1fXUgTpcWm1E+OpmGj1R10UGoTletx0eig7dbPtZVgLovgIhwPiWMiSWEHeIFgiOV
         W+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770729; x=1796375529;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BmBlqkLTRWPnM/PyPREkTVAoRCehz9jfOuEcWz3kOo=;
        b=Zb893AfCjL88vGjmv2lKLLBGhtoBIxqZQJRmtASOSrNQ/w8kONYfc2X1rv8F8sY++V
         E6gKSD/wbaqHti6/JzfEfbtuBnjje6ro6luH4UWIlgw63AVhmR+GaMZD6xoJTcWCpb+6
         Jf5Nalg1cUgOomJ4WOLrowLhLviZoo0FrN7lf0ae7dLgtGljtfskDGuThkERYxRq8btG
         wuSn01gVVCPZleGAxH40urmQgZX02ZOgkMVDSjd4qIogOBZeMUDSwEtYheWbiX3eOZcK
         cB6xXo0Nz9I/i8CsbZMFvM5zPIVb8ws0QH+MlWpkrjRRn65VkqQkxwn57o+1u7UXySAB
         VdYg==
X-Gm-Message-State: APuU4Z8vEGCFkabp2rAaGEJlRdv3dKvMEN5kqJjHZcvGU8oVxHlb4kZ7
	ttFsC+6DAz4+Pz7NiyTTTnFmyxjLXWqVjXqq1WkRMoykrDUAmHq2PVzA4MHQgp07YSo=
X-Gm-Gg: AZFdTZcNeCe/D2fi6ivAvvZD0CC1xDHFED+1DgqGTu7ZXBFbAFLzR4C44ggbMPtbEMa
	wLCDV+Wvr4vWEGfjE2iSYoNoqzQFQPsoJz0OAEOr7clWvftNsucblw6ZuIV3l+O2K/3Zp5SxfH1
	UfdBcezTbG9NvoI1XLOgr1CZAKlCE9vsu8exocHB8DK7xgukTPO4c9vmJnDvTCeRkql2qqtLANM
	uMXVk8gO2wk6kZaDyB5WVU48h+Ol0hxuw5nr/7V2HhHvelyMbbdXrMt9YOAxC+gPTfoWCU9lWBf
	4P3WVHh6NvAQ2bB3QpFqH/4fuD5pK/tgq22wbqYVC01OnCuLhnlHKdMjCEruUX20q7439tcrqRI
	NhDmiT0jIgP+01TGbPUTAFQE54JvuQuTVCS7HWNDfdZDy+W3jKqIqpEI0FvnkN+3XuwGyUiEDoV
	fNzoGiQzd+UiX0SZJGYaB4hsMUvoc1e2uYacdRI2sJSqr9FXXYgSb/Ys4vimjQkpHocZ1XUYbZ8
	VuQ+17dgJ3hLYvXeyfrT2CSkddq+pw47I1F1BFTs2jSSK1Y4mPFK58JNlzVb0iqMA8vU3xwA014
	zOZmN8DrgLUML25Pwr8YKmq3ImLhhjItrzCn
X-Received: by 2002:a05:6402:13cb:b0:6ba:4bf3:4a2 with SMTP id 4fb4d7f45d1cf-6ba4bf305c0mr15740801a12.17.1795770728948;
        Fri, 27 Nov 2026 01:12:08 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm43017556f8f.18.2026.11.27.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:12:08 -0800 (PST)
Message-ID: <bd8014fe-6a77-445d-b73d-e87404638593@tuxon.dev>
Date: Fri, 27 Nov 2026 11:12:06 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] i3c: renesas: Fix zero I2C SCL rate on pure I3C
 buses
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, stable@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-1-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-1-2e76b87209bb@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_011211_565334_9396125F 
X-CRM114-Status: GOOD (  20.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Diogo,

On 10/26/26 13:35, Diogo Ivo wrote:
> On a pure I3C bus there are no I2C devices, so the I3C core leaves
> bus->scl_rate.i2c at zero if i2c-scl-hz is not specified in DT.
> Deriving i2c_total_ticks from that zero rate programs a zero-width
> open-drain SCL into the STDBR open-drain fields, which are still used
> in pure I3C mode for example in DAA.
> 
> Fall back to the 1 MHz FM+ limit instead, the fastest rate an I2C
> device could have, so that a sane open-drain timing is programmed.
> 
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---
> Changes in v2:
>   - Substituted if/else with ternary operator
>   - Picked up R-b from Wolfram Sang
> ---
>   drivers/i3c/master/renesas-i3c.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 8b264f72e55c..78d0a2c4a19e 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -579,7 +579,15 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>   	if (!i3c->rate)
>   		return -EINVAL;
>   
> -	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +	/*
> +	 * A pure I3C bus has no I2C devices, so the I3C core leaves
> +	 * scl_rate.i2c at zero if not explicitly defined in DT. The
> +	 * open-drain SCL fields of STDBR, which are used for the DAA
> +	 * pending read, are derived from it though, so fall back to
> +	 * the 1 MHz FM+ limit instead of programming a zero-width clock.
> +	 */
> +	i2c_total_ticks = DIV_ROUND_UP(i3c->rate,
> +				       bus->scl_rate.i2c ?: I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE);

The manual (at lest the RZ/G3S, Rev.1.30) mentions on the documentation of 
BFCTL.FMPE bit:

Set this bit to 1 when using the transmission rate within a range up to 1 Mbps 
(Fast-mode Plus [Fm+]) of the I3C-bus specification. Set this bit to 0 when 
using the transmission rate at other rates (up to 100 kbps [Sm], up to 400 kbps
[Fm]).

In case the i2c_total_ticks = I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE should the 
BFCTL.FMPE bit also be set for the operation you mentioned? If so, maybe set the 
default to I3C_BUS_I2C_FM_SCL_MAX_RATE to avoid any further changes?

Thank you,
Claudiu

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
