Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E7DCDB465
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Oct 2023 19:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05v5mpUwBasEV17/bOuqx8BkGCm/edhh2GK6Xabg4h8=; b=zNXQqh0ijGzktq
	O4rI7LPhqD7+BGfhb69jEKeEp97BP1FU+D+Q3NCKPKNwAS7ewAw4H8KnD9d1nCZXzxa+wLP0BrHim
	4JUuiFl/f7qBTNhZYfsyKing4BW/VUskkg/e/MB0+aZA78BDCMIIBXvkQqJwZP/ajdnn/LiPAe9qw
	8NqjFSt4jgcGXlqCAsW+7MKTJZdpKSySdjqIK7dnRrIX3vGd2MZKO4wAzVSLM6j6+6GhLq0Ciyu3Q
	EF+7H/i81irufz4Tj3aGds1rqGVp1MhlguhalzNgfMPUpKaiKVElNQWww2SBjg4rBdloosidFI3Jd
	rG827AdyaK/I0oUx9kMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsTiQ-00AREi-2K;
	Mon, 16 Oct 2023 19:57:26 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsTiN-00ARDt-24
	for linux-i3c@lists.infradead.org;
	Mon, 16 Oct 2023 19:57:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9adca291f99so771084766b.2
        for <linux-i3c@lists.infradead.org>; Mon, 16 Oct 2023 12:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697486241; x=1698091041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YUMQ3e571bMKFKJPxMMWYoR7G+qW9/yXaIF/Dt4+E9s=;
        b=H/dxh0gihVU0Se1MdHmQcFpPh4moNDQK65AecWA2e4sqacBNpR6ULgTRdTREWTvYj3
         B53p/iApeoyJPOxjNcYEqA4jgpMVPzpbxA3n0Y+mPsFeH0d6yAW2Nv+ueTkf9uZ4BpZN
         /oCRQ6OcFsD1j3k4tC+ADIzZH8Tah7/4BcVDrckfnzN4plWpn1Y6Fze1LDkHYrRz+h6r
         U2cWUNRMGufq/Am01LKenJX222DaGV9Fq6A/1LHtKmX4OinRSH6X9ejyEmCgDaW9d09N
         qOQ4XWXEp1HoODJu0fOAHNZvOy7iBeOMFkTvK6F0V1Ne6mnbYJ6PHYVdcKibswPqQUhu
         YzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697486241; x=1698091041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUMQ3e571bMKFKJPxMMWYoR7G+qW9/yXaIF/Dt4+E9s=;
        b=VO/BqQ/FN5cJblMaHZdpIFlzj+9CJO0V5uhxsrCjmFeDqwG9QY20nTjWCMcW8Qxm7J
         irRPc+3cvYs5LY4AJyHJElI9gEYUqJNOh3XunnGa4aDds8jAA0QQAF+YQ9i62zOK3IvG
         nb4PRELP1nbiZUM39QbnPeDiy8Fa/1q7lVVuJ6C7PNz+YfLdvFJdJBeDZxGGLQIVr7IU
         8adoCKUSMSmwkWFjKXpbIgEMG1Y6r/iUiozRvm+ZCE44CubKLed1AM0OcWaSksDeC222
         CS+v6LlufsBQhGiwi8XZ9UzjAlHYU2s0a+nFEGGbxlK0JKTKSH/L74m67uUre25l4ENS
         wqHw==
X-Gm-Message-State: AOJu0YzD81/NaCftQ2Qq+B34vRyFppUy8ktCaO79uuZnBmyThlIXLpEh
	kBn4xRmwC/pjBlBCJXSYu0xMpg==
X-Google-Smtp-Source: AGHT+IH6D6vvbbzctNR4LkctlKTVJiiDlY62sdTmxDgMS20IZchL/tRbTu3wPkTeLNdRrydnhY1r8g==
X-Received: by 2002:a17:907:702:b0:9be:2963:5671 with SMTP id xb2-20020a170907070200b009be29635671mr56773ejb.69.1697486241380;
        Mon, 16 Oct 2023 12:57:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id gv12-20020a170906f10c00b009930c80b87csm4661374ejb.142.2023.10.16.12.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 12:57:20 -0700 (PDT)
Message-ID: <6110c58a-8003-4889-9a4b-6a7d1821c00e@linaro.org>
Date: Mon, 16 Oct 2023 21:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: i3c: Fix silvaco,i3c-master compatible
 string
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>, Conor Dooley <conor@kernel.org>
Cc: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, joe@perches.com, peng.fan@nxp.com,
 alexander.stein@ew.tq-group.com, haibo.chen@nxp.com, ping.bai@nxp.com,
 xiaoning.wang@nxp.com, sherry.sun@nxp.com, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
References: <20231016152450.2850498-1-Frank.Li@nxp.com>
 <20231016-chatroom-regulator-a75f1d8be809@spud>
 <ZS2Pz1HxUgrx4+0R@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZS2Pz1HxUgrx4+0R@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_125723_676805_C3FACD81 
X-CRM114-Status: GOOD (  13.05  )
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

On 16/10/2023 21:32, Frank Li wrote:
> On Mon, Oct 16, 2023 at 06:30:11PM +0100, Conor Dooley wrote:
>> On Mon, Oct 16, 2023 at 11:24:49AM -0400, Frank Li wrote:
>>> In driver, compatible string is silvaco,i3c-master instead of
>>> silvaco,i3c-master-v1.
>>
>> And what makes the driver right & the binding wrong? AFAICT, this is an
>> IP sold by silvaco & the -v1 suffix was explicitly requested during
>> review of the binding.
> 
> The driver existed for the long time. DTS files already use
> silvaco,i3c-master.
> 
> There are two options, one change doc, the other change dts and drivers.
> I think change doc is easiest ways.
> 
> If there are v2 in future, we can added silvaco,i3c-master-v2 in future.
> 
> If everyone prefer change drivers and dts, I can work on new patch. Just
> break back compatiblity.

No, because Rob explicitly pointed out too generic name.
https://lore.kernel.org/all/20210111200821.GA2978830@robh.at.kernel.org/

Is it some way to avoid implementing feedback or how does it work?

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
