Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33955C36005
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Apr 2025 07:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qcS0wORkm1nAuZRU+AjzF1CWogDKdC3Umh9nnDiv7E=; b=3GmQjRmKJ+j9OA
	jF5VF7YZDbWAXlistoH4bhJythYV1dFByTpp3N3g7sV5Tqx4x9OYzO6PWzzj11dV7RhXr+/xi0aSe
	ngUpFaTEb4JYVLu6DXZIBw/hbzox5HNHe/zfOcxdLsbFQj7prSsJk7g8qKLBlbd/2hHQu3vdOLN5o
	m9Hf7+xTfoHkWjyQpbCv3QiH2wnbRRj1IfHF+bepzHDuU+iwYbqOtrvTgTNuSfr5cIOw5ScD6Os9t
	j5JHhH/B3idxfzWHpjBn4xaPdAuQzHcVlpgYq5V9YHiNP+YAA3NTEyb3RtoWGJf9/q2YHH1XQdBzA
	hkLVSVD+hyYnTSG0kGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IUo-00000005B3s-42Qs;
	Mon, 28 Apr 2025 07:01:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ISd-00000005Afr-0mM9;
	Mon, 28 Apr 2025 06:59:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83FE9A49D09;
	Mon, 28 Apr 2025 06:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6DCC4CEE4;
	Mon, 28 Apr 2025 06:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745823566;
	bh=NjZjaesi/xJEEaiOj1GfSTanxXQS8uoOntzAyCFJJpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4Q/lsqAp6xsE+SQgVLcmNfCP3Xc/pgT3AMTa2iDfOrBQDv8ytR8Ka0ZlaYKinZBa
	 YdIem+llaGJSuy0rmgm4e1j6+uIXHBb3KuxTubQdV1FOHWci55IYEVwShN+nGFgk5R
	 HzPhpv1YtQYFX+4VkMgvqaeBiCSMn2XpvQ4Dum9FvYjLY/mRLhdVoXUDJaWSEadt5I
	 KjZLBT6rQliZStdsv0071JTXcmHDLVIw41W/EnsQT7UlbQXN70yP2/TTs6TX8L9yBT
	 Ah8IdlFnHjw0tgisn4Y589fJ/Q5giLkraa6WKVIwUwAZ54O5ioUja5ly/iF8vVAYNg
	 ZROxyxm3zG+1g==
Date: Mon, 28 Apr 2025 08:59:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com, 
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, conor.culhane@silvaco.com, linux-i3c@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V4 1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94
 and i.MX95 I3C
Message-ID: <20250428-topaz-mamba-of-pride-cead0a@kuoka>
References: <20250427083230.3325700-1-carlos.song@nxp.com>
 <20250427083230.3325700-2-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250427083230.3325700-2-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_235927_294087_D7FDB5B0 
X-CRM114-Status: UNSURE (   8.17  )
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

On Sun, Apr 27, 2025 at 04:32:28PM GMT, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add compatible string "nxp,imx94-i3c" and "nxp,imx95-i3c" for the i.MX94
> chip and i.MX95 chip. Backward is compatible with "silvaco,i3c-master-v1".
> 
> Also i.MX94 and i.MX95 I3C only need two clocks and Legacy I3C needs
> three clocks. So add restrictions for clock and clock-names properties
> for different Socs.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
