Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043E8C48BF8
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Feb 2024 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Oz+141HLEky9dApoIJqLLGMDQXo4iwRtn0xTRehHkI=; b=UeJBQVu3RNZAxsH4vEQYt0J0Kg
	sALQvv4IlK5eCpJuLkAUogwPRKZaLP1e9FQ3YAUeXQvSppqG6w7MUHFWKPqrMRBAo5SLAgrStwYwh
	cDBKjyN7HBPbQQJYw9pqpdLZR2LQYBI9vxURHNsEpbE6/GTKW2wlmDnmkZnTwv5qSCMqvnS9LVbQo
	eu2+grQUpNTzmK6clrk9B/lUqPp0oSuiUG04dj6JDLlr2sfjVNst9aA/2DmFW5ojdxzDEC7kTbosV
	HndqMgupV26dbxmPK77/Nt6ZEyw5hOfOOwJIspx6I7ejRKHOpZ9HZgIL/kNG9lCrj3rkYW9sL4TDK
	a4y24Etg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcA8m-0000000C4Ob-2jgc;
	Mon, 19 Feb 2024 20:21:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXBrh-00000005tCi-3S9H;
	Tue, 06 Feb 2024 03:11:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F0B76132D;
	Tue,  6 Feb 2024 03:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E16C433C7;
	Tue,  6 Feb 2024 03:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707189068;
	bh=JBbzQiMIyRNQkHSvJ9vi5exp7CSEo5Z8O7BLUiZ/mBU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gmDxqupApi+IvheVBPHwfgCZY+3FTaeC4+Or0OO611MjRbNGbFvWIRWP528mtnX/r
	 eNphy238xKie014dn6UoEmVSiMctMho9mRKLRi65CW1BK5opN525Ju0SV84/SeuBET
	 EPpp36CB08qqpZgpkzESn0TThsoJ6mCyKlOr5VFp1BLAHn4+nZtT0EbwFav7o2xgkx
	 Iy+dEdip3+FZS7aKtqcIcaTsMenicIxdeoQdxCcTF7O1JVoX3K5lVPwiew9kyNzZ55
	 UxaEmcmCy0BB7+yzDDFpGapr1AJP7J3GHCtUCgJ4lMGTc5FXUV+79BVr7+9Ojm+ZII
	 z7VXBYOxWMR2g==
Message-ID: <f3ae2e5a-1850-461f-aa9c-2c7bceac8318@kernel.org>
Date: Mon, 5 Feb 2024 21:11:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: intel: agilex5: drop "master" I3C node
 name suffix
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Conor Culhane <conor.culhane@silvaco.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Nicolas Pitre
 <npitre@baylibre.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
 <20240117075618.81932-3-krzysztof.kozlowski@linaro.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20240117075618.81932-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_191117_946488_0E0B78E5 
X-CRM114-Status: GOOD (  10.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 1/17/24 01:56, Krzysztof Kozlowski wrote:
> Following change in the I3C bindings, the "master" suffix in I3C
> controller node name is discouraged (it is "controller" now) and not
> accurate (if device supports also target mode).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> The change can be applied through independent trees, if the I3C bindings
> change is applied.  Therefore please take it once I3C bindings is
> applied.
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied.

Thanks,
Dinh


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
