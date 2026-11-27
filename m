Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C311E606A32C
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Nov 2026 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zIaONPG+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=TpGmsVtX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iJYtarXypVDkAL7GTDOfMDHoqE8vHokByo99yxjvWPU=; b=zIaONPG+Y3AgDJYcmuJmjZ97EG
	yZL5kEZh+wq1tbsV7Wbog3AQHbZJcEix6YltZi4pivYnfnp1lZQsEQD/tz8BqUNQcdopy5NOQDrDl
	8zTi3LqHc4OOI1sOqWI0GV6nm1TKKsFZjraJPFLxEJgCqbLUKHL1PgHNDftILON4gPALuMeAFfiVv
	dhPab7swltkB2CkDGPK6Zr+6OebMO6J3dnGYhcxVzGOCPNhPCHwvUmLiuIY1BLqJokcbtvkvnZkmx
	YpJ3LUf1DboNlYeIC05XpOAC7PDdRo5AdlK+l8ga8baglz38ofwvdSxb7M1DeWfXupDRS/VMCtD8e
	cho9Bwfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs4f-0000000FP2f-2ILi;
	Fri, 27 Nov 2026 09:16:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs4c-0000000FP28-3lcv
	for linux-i3c@lists.infradead.org;
	Fri, 27 Nov 2026 09:16:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so4914674f8f.2
        for <linux-i3c@lists.infradead.org>; Fri, 27 Nov 2026 01:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771013; x=1796375813; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FthDJgeAJmR+CsDyiqI3a3aJL/56y9FuIeVs2tpiliI=;
        b=TpGmsVtXGJmitpz7TIb4XJ7CpY1UeJcaksN1OaIlAf4BUi0NiVMjhmLxvC5vVAkKHt
         R0MG+l9i/iR8nFdpEjUwHayHmRZGnZPOJms5l23/m67UTFffns+g1l66e9mozksDUBSy
         Ht0HVqL96vd8lWPcYmZA1ug1cy1ixypDJSxFuItijRbiaE9OTfZrTXH3JQU1bCVA+Rpi
         zjaL5ra9kU1OQfH8bNuk+LKY1EC6u1qNef1qIeGJNQQAIktHWkSENaZoayVqJh13K16q
         XR8k74Fgsrc8ANy+BKa9aSWHbk8TSPP1A6wrKVje1AMy0M1SffPNnNwETzm/AfKSVHT/
         gfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771013; x=1796375813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FthDJgeAJmR+CsDyiqI3a3aJL/56y9FuIeVs2tpiliI=;
        b=CCODM5LkpNvr8P2Ky/N8CF08nKaYTX6J4MgXfA7pwp3VhM5ecKbpzdpzQ3qHnLCGUw
         OwJqSlYaOgYR/OSwuhVyEZMAxSoigtkgIKcgzfC5dTwJYQSTvHiQXiOR7E/5u8PPbSDU
         JiwyyZhZbNlmqcLDsAgFp8c2f6YGTEOz9bEpr2Rsk2zEKv8sC72dtWS3kpOGCMKWBACU
         ZNuzboo4jB47AQbQncFAojBcCiEk+TIPi9aS1rukm1sYhzRDbgpe4sQFsOEJC2XCUuEm
         j2sqJkEd5p4qizX8CMdDwhC/3ZRPOVExc/MbdSh6SgBzoWrtn1dp263HjiWj4vasZZVU
         +UOw==
X-Gm-Message-State: APuU4Z8AHl8oDqyPW1fa/5/GELWJM2FuF2SIY3JwFAvP1JSu0xIRRy+V
	5Qi/zxz2zZ4rwH9OEjUuMl4bzG5vNpih2/mQA7DJx9rJWGIhMXBMmaFAumdfnsxcQZg=
X-Gm-Gg: AZFdTZd4Gd4Bh6/5UhnEnAH2lzCCKA2q4Oie2AqxmkDOrDSvhmuGTcPOs9M4A8DmZ9p
	8RDRl5KSHGQMnpPCjcM53VC/ruabveb4cO6OdAMHNQInjrxqMTKyVfg0Br0cW8lWCpYbg7Xd4cN
	IZhSfREYU79/ShC2BABWl9dhObEsaBiaER6x8SAREvEeTrGTMGtfbmOa+/5NySIyeFg7X4KIBWQ
	1LIS4q+P9MTuAFD+1Srh5+HVZBQTlZej9GdedY+mEQIJqLNY8x0Cwi99Cdt1sWhNxx+9DOdJngC
	L24AsVUe6qtUlhXBcneC/JpDdXLQONkZ/8ZIrT31e9R9UdFV9IqN8k+6tUAEWkxCYkBeT+Qx+ys
	QK6mmekzbpRpoBNoPfqvGxF5+7DPzBXA7F41uLir9nV0R5ViruUh2ICVU/DmHBJ5RARWpihFEkE
	Yf3+WSYwctKfpDscN7aPt9jg8xAJQG0pjoiN/LIXVrViI6HlVSus2Vzuyuy2JuIQnWstC9Onqe1
	rICxmqj/a2J6clRG9vSq7/3unAmBCRSBigCMRu4HGk+BvNmOG79hu4gNu0YCh/ZeewJJ4hSHul+
	4ZafIFkVjrNKSCQ4o1xUrDZiTyYhBiXW0xWm
X-Received: by 2002:a05:600c:3b8a:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb88824fc8mr506682605e9.34.1795771013014;
        Fri, 27 Nov 2026 01:16:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1231003765e9.4.2026.11.27.01.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:16:52 -0800 (PST)
Message-ID: <121cc552-86b6-40de-ba9d-0ae40f8a1ed2@tuxon.dev>
Date: Fri, 27 Nov 2026 11:16:50 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] pinctrl: renesas: rzg2l: Split SoC-specific masks
 in struct rzg2l_register_masks
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
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-5-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-5-2e76b87209bb@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_011654_987384_8FAA3E93 
X-CRM114-Status: GOOD (  22.11  )
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
> struct rzg2l_register_masks declares the masks of the OTHER_POC register
> of RZ/G3L and of the I3C_SET_POC register of RZ/G3S in two branches of an
> anonymous union. As both branches share the same storage, initializing both
> other_poc_pvdd1833_oth_awo_poc and i3c_set_poc on RZ/G3L would have the
> designated initializers override each other, ending up with the I3C_SET_POC
> value in the PVDD1833_OTH_AWO_POC mask.
> 
> Split the union into a common area, for masks shared by multiple SoCs, and
> per-SoC areas: the RZ/G3S and RZ/G3L I3C_SET_POC mask moves to the common
> area, and the RZ/G3L OTHER_POC masks stay in a dedicated RZ/G3L area. This
> way every mask gets its own member,

 > and new SoCs can be described by> adding their own struct
> (possibly inside a union).

That may be missed by the next person adding it...

> 
> The existing RZ/G3S data only initializes i3c_set_poc, so it is not
> affected by this change.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---
> Changes in v2:
>   - No changes
> ---
>   drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 ++++++++------------
>   1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 9bf3743dc1ce..f73d273df362 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -278,18 +278,14 @@ struct rzg2l_register_offsets {
>    * @i3c_set_poc: I3C_SET_POC mask
>    */
>   struct rzg2l_register_masks {
> -	union {
> -		/* RZ/G3L masks */
> -		struct {
> -			u8 other_poc_pvdd1833_oth_awo_poc;
> -			u8 other_poc_pvdd1833_oth_iso_poc;
> -			u8 other_poc_wdtovf_n_poc;
> -		};
> -
> -		/* RZ/G3S masks */
> -		struct {
> -			u8 i3c_set_poc;
> -		};
> +	/* Masks common to multiple SoCs */
> +	u8 i3c_set_poc; /* RZ/G3S, RZ/G3L */

I would drop the names of the SoCs close to the i3c_set_poc. That have the 
opportunity to grow over time. As Geert considers better.

> +
> +	/* RZ/G3L masks */
> +	struct {
> +		u8 other_poc_pvdd1833_oth_awo_poc;
> +		u8 other_poc_pvdd1833_oth_iso_poc;
> +		u8 other_poc_wdtovf_n_poc;
>   	};

OK, we can drop the union but the next SoC addition may be:

/* New SoC masks */
struct {
	u8 x;
	u8 y;
};

If we want to keep the initial form we may need to pay attention.

Patch is OK for me, just with the mention that we need to pay attention if we 
want to keep, for the future, the approach before this patch.


Thank you,
Claudiu

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
