Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145EBC48BC3
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Feb 2024 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxZAYaLmdyErtZ04gk9FI4RbDnlGz6Krh/luh9sYA8o=; b=DHkCl+McBtWwtg
	T2Xj4W9XUl7iziKDSAGdTsYyBlalKLymp5uU1xbWx582cHJTDbtqS+WxPeN3JLBoOgbkIzU1MQ+nK
	QibugVaAO3ulsRbXKIrKFH808lmevrvTa7cG6tPvMsK24Qo8lpEKMAzmJeppeM/0pElEAG9XMTUx8
	F2jSVkupQ/nV8BGXMFOpyZPGbITPSPbqMx5SadUvYujthOsc8icPUAQiHcLmMu7EWY2RdHQj1dT7x
	gNYKG1xBcxAloQGgu5uNaHF7+LjrwaP4H0Fcpba76eSXPP5Pg6Pm+qOvgW5trJKvd3G8t85pvdn0d
	NAcaP7yGhAvsOLybiJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcA8m-0000000C4OT-1W3Y;
	Mon, 19 Feb 2024 20:21:28 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWvcO-00000002gTb-32pX;
	Mon, 05 Feb 2024 09:50:25 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6da9c834646so3366367b3a.3;
        Mon, 05 Feb 2024 01:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707126618; x=1707731418; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyxLyOfbVqgM9WmxXwGUihLV7GhZ9dmSNbUWWpB1kbo=;
        b=RpTvKD+tioYxW5jAasAXyZfmXAxmP5Au9HinPLq67BL3ktw6J2m0uuVCHC1Q/VJhXq
         4OnkEJlQsn0INcfbPcaoKECurkm2mgbf5T76OPX6uFpb5bxsiGGuZ+qnFd33XOwb1TLT
         y9dCtiYAR9J8ScKCdj63uO/5A3eC0Tj0gAE8qOeqYMiJq+R/uNUabciC9WFaYUTONJgv
         xkNNcSyBLFKpB0Zbdj+B+pt6iAwzT2BdQOKRnF6g3AMbTED82SVGaa0JzbG9BVnf3XkJ
         /gPoubsvV+858hp6v3iC4OuSidVTz5E8m6H2azx48bg8s/ZBel2S6NdPq1jt77hXhzSu
         mxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707126618; x=1707731418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyxLyOfbVqgM9WmxXwGUihLV7GhZ9dmSNbUWWpB1kbo=;
        b=WUpZ1qD2qp78uIRCJsb/N1zxQtyhZkE5fZ71kBDRo4XGGO4MIA8XQLArFWHRAqyxUm
         sV/6gHYmzBZ/I50EGsUmm4gCr+rC0lg5h+TfiMwaYcMFI3DOqfZESO6i5jOElD+xFIkX
         e3ruR8fDIL4ICVez7lQ+aqSvUy2NPtgeKJGRym8RFH7/mFREpNAVMJio2cZ4ewzXHc0D
         ZErZaPdLOtUBiZEHlkdLk2Vx4EkKZGae9peU98Px9WDrv4VJZhrQ2ON5uXB1Uor4azT/
         78SxiJiwfRNEB0I6+yvQB7ulvb4okMM8SvoPQCT4ERjnOPmsWfLk5A373leDBejfzHqV
         PkkQ==
X-Gm-Message-State: AOJu0Yzk19Z9firxkz77Clcp9oWzzHXmh7QfH1jCJPfOtT2C3ibe8PlM
	YJ9esTxGPJeKjxMy0mUyBQDjUBroh8gMS3ouqFAsM0o9bUu1Bwx/
X-Google-Smtp-Source: AGHT+IEaQlbMDkqls+1z356bkMGfAyosJJfP6FT4PccIh0PILxVE9gnQR6IFhec+C5UYqdVXv36p6g==
X-Received: by 2002:a62:e712:0:b0:6e0:3ef3:db3c with SMTP id s18-20020a62e712000000b006e03ef3db3cmr2696758pfh.29.1707126618105;
        Mon, 05 Feb 2024 01:50:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXCwihz3NvpgC9gV7esiVF9I1di4G/tdzvEwGpDMug8aT8iuL1ZcyvFDxwioqQhicoFmS2+U0/SqaLJvUhb0WiRP/bp6CchoslH868BFpy4DgpDEbfnNZLpiE5GCqJ+c8wTTBbDHlcY5wEwtkZnmPudtAlPzQEPDvgDkvn4kejFrfvfYlrO6yEWalSJrDPGghQZbrrH0el23aBwW5Wl78DdevWRIGBetaDQ8Rl3kQWa9JDGzODztNOiRDPez+sZIeQHmRmpIvoSOSVU2NI+HMeXC9/A1rFLBPdeYvK6B91Vco25iEcf6BnqN4tsKu0ComBO/ThR23H+VgSBa/k2k42DyegcBFWE1Eczddqq8Ruey9cieXVxSLK3CVQptyqKr7V5wPOgg3cEDVT55WKsQs6+udWIHwgkGZeh2Tqo/yl0X/YwcEGrPdZnMDZXPGTXBwlDUtL1ehef3feEWXhmDptdnLGD9inMm+PMK1TyGeiLz+TPZQiU7cG2dVgpG0b27vvDA1BHzEn2ldWq37dPacfq9OJvVeS9yptfyzqtX9xmdpc8VSuUH7oimfLzyaKxqxXKjaHRGu5Oh+xqI3zblgj3Ml/aOKAXPngklDkuckbssdBUk87cqHvlBDgY9KGYXcojZ7jg8QoeTITkHmz3oJw8uOtWpv1lRdass5luG3OxqWWy04qcrf9QqaZ0TCxlI/TnKPsvL3agms3YrpDgtA7gxuQ6I3bWgvBqg7Z+5TLPgumjGqUu
Received: from t480 (89.208.247.201.16clouds.com. [89.208.247.201])
        by smtp.gmail.com with ESMTPSA id i21-20020aa787d5000000b006e038327bbesm2757236pfo.79.2024.02.05.01.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:50:17 -0800 (PST)
Date: Mon, 5 Feb 2024 17:50:08 +0800
From: Shawn Guo <shawn.gsc@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: imx93: drop "master" I3C node name suffix
Message-ID: <ZcCvUJNslxafvCab@t480>
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
 <20240117075618.81932-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240117075618.81932-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_015024_788930_71AEF3D3 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 19 Feb 2024 12:21:27 -0800
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

On Wed, Jan 17, 2024 at 08:56:17AM +0100, Krzysztof Kozlowski wrote:
> Following change in the I3C bindings, the "master" suffix in I3C
> controller node name is discouraged (it is "controller" now) and not
> accurate (if device supports also target mode).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
