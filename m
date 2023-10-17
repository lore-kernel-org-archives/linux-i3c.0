Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6169CCDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 20:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGvEbdaPgPB5dfM8W+qXWrA+QCxPw03zBs9BBidAAIk=; b=oCHyA+9dXKbhGu
	pFo1NmVwz16wyDSBaMmOJqssg6bSVyYPotgb34vJOnyabRr68tClsMI4amQ0EanH990iBzZK8Xy/A
	fQ0iS/O49s9cDac/m2gbliyI5Xf14pc7oO+q9DEEy52y4ZEqfdP11FEmS6sjw65sKVQHt+xwBWCL3
	cUuUMP2NSAMKN2SimRjdI+asjmXGuhX9Y+AAHXT/uyHfhZdsn4gMo2Wf1GqEbouiE6wAJAYTuqnoN
	BLBs8RpE2qniW4xUFZP+aB9nYFuJwJIv73L4Qm2KCEJv0lVOLLYyZ35QUQ7tGrkUMJGzq/234d46q
	E4NaoASSYfkTUSDxYAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqSE-00DB4f-32;
	Tue, 17 Oct 2023 20:14:14 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqSB-00DB3v-0m;
	Tue, 17 Oct 2023 20:14:12 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1dceb2b8823so3113998fac.1;
        Tue, 17 Oct 2023 13:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697573646; x=1698178446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjtM0th7Ga0wqAkmHHke7zShNUXUXypfVS93GqDMmaU=;
        b=c0b17fmkwDLJY9TwtV7OJJNnC7fP2lUsgDSTUZU8TxWNv9CCd/c1lw/8HP0+RXXzZq
         7x78W9w4fkWNWTsWVu5KqB9wWa4BKH5WFr2sYICHxker0yW7vDOHUeH4ZDGs2jowXc6O
         3ARlKZe1aIFPU65cCdSZyyZi3oz11x5t8qs3euH+3IqjVKS3kHxVNsHx5GFY7JrG2mqG
         F5YZBPYicZcxLQ976yx51yNBlfAZQhE8doNGBP1fb0F92a6VQua4jhmFLMBMc6NSooBx
         /ZYC1EyFMEp/ZmEphcaxmK/04M/lQ23Rd5RkcM7s5p1JDddeshD0Nd6wBIHQpuCzDwVk
         d3KA==
X-Gm-Message-State: AOJu0YwNn0ZzH9yM+VKQlq8Paam6DSc5RSe+xd09QpXvS46ziEMClzzj
	NPDFkJYquwkY0J6sdtiA7Q==
X-Google-Smtp-Source: AGHT+IEsn7NyYyz1Bs7OZ8OxYl4q66dyjxMFogx3095CSeMhQzjqBlURuKu92JrCzVigMEE82ibKSw==
X-Received: by 2002:a05:6871:c17:b0:1e9:d481:52e9 with SMTP id ve23-20020a0568710c1700b001e9d48152e9mr1820295oab.28.1697573646610;
        Tue, 17 Oct 2023 13:14:06 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id lb5-20020a05687c330500b001cc9bc7b569sm394499oac.27.2023.10.17.13.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 13:14:05 -0700 (PDT)
Received: (nullmailer pid 2675575 invoked by uid 1000);
	Tue, 17 Oct 2023 20:14:04 -0000
Date: Tue, 17 Oct 2023 15:14:04 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: miquel.raynal@bootlin.com, conor.culhane@silvaco.com, alexandre.belloni@bootlin.com, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, joe@perches.com, peng.fan@nxp.com, alexander.stein@ew.tq-group.com, haibo.chen@nxp.com, ping.bai@nxp.com, xiaoning.wang@nxp.com, sherry.sun@nxp.com, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx93: add i3c1 and i3c2
Message-ID: <20231017201404.GA2570433-robh@kernel.org>
References: <20231016152450.2850498-1-Frank.Li@nxp.com>
 <20231016152450.2850498-2-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231016152450.2850498-2-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_131411_454343_C78FB8E5 
X-CRM114-Status: GOOD (  13.98  )
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

On Mon, Oct 16, 2023 at 11:24:50AM -0400, Frank Li wrote:
> Add I3C1 and I3C2.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 26 ++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index 6f85a05ee7e1..4d9ed0b32853 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -242,6 +242,19 @@ tpm2: pwm@44320000 {
>  				status = "disabled";
>  			};
>  
> +			i3c1: i3c-master@44330000 {
> +				compatible = "silvaco,i3c-master";

The real problem here is not whether we have "v1" or not, but you need 
an SoC specific compatible. Unless there's a public spec where we can 
know exactly how many resets, clocks, interrupts, etc.

Rob

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
