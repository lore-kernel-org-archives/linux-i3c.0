Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF85C4167B
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Nov 2023 19:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/RoUU9uI2/j2fU3BBm7SIOWKqvTtzJeeCwTFFijIIA=; b=VI6mnnAAxsIDiu
	wZ/mTNKmCTFnaAd6LHo0tuvfvnPrK/uauFv8RfPWk3YkZ0M613uZ6bq76BUv8+0Vsi2ip2WpmqHT8
	AOGlFXasLmdwDbq9cxvtXSamJd+9NFq8RUY73BMEMHwEUeAupuWmSLldqxPTNpIAcpTRjJEmNjarv
	IV25uA+nPxKwxaQoFvAmR/TEgXxJ9jIT4cJ8XaGtmmOjLxzAc/ubcvFRE2hJLmseERr54G0LpvaK1
	E6Et7wqE5Y+4SRUoKV3gecqnknz7dvXCupScVYWRZSAmDjbJNBDgBst23F+2+dKIuSfmNWyfqahi+
	TFD3eKC+AyZi3JYy61kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7hif-003Oei-0y;
	Mon, 27 Nov 2023 19:56:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7RFu-000hPF-1t;
	Mon, 27 Nov 2023 02:21:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 549D460F93;
	Mon, 27 Nov 2023 02:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E88C433C8;
	Mon, 27 Nov 2023 02:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701051707;
	bh=bC2ssL/QECbp/dStYuVy7bosUCcMH2N8jkkHjJLYJnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esUJY4t28KqAgZi/NF1BJyvYwUsOTktrX0mBJwlFALH1aUm04CCexiidqrEj62rrR
	 BG3QcWecVE5NUN60mHWGx4SGYzV233ltR7ooW1dO42dWuU2bitFPGi9MxptzCzFJSs
	 t+TvM3XCED+uQ7NK6D28ct22hL54NBucjrD+CH6Qpt0ANLIt7FMrWUJMq16cSinVwR
	 DbhGZeqLSi1vlqqoXpq4fHYOD+qkpKDuhz+507iEc5l1M1pRHLDryb2/rtVL9Xd4h7
	 iaOugiYBPUotxLOhUh9R/IX/Qi5F97X3OW46oWQcrLwBqeevgXmwVQk/JgZSSSFTNb
	 eAAtKGtcIWwJA==
Date: Mon, 27 Nov 2023 10:21:40 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: alexander.stein@ew.tq-group.com, alexandre.belloni@bootlin.com,
	conor+dt@kernel.org, conor.culhane@silvaco.com, conor@kernel.org,
	devicetree@vger.kernel.org, festevam@gmail.com, haibo.chen@nxp.com,
	imx@lists.linux.dev, joe@perches.com, kernel@pengutronix.de,
	krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-i3c@lists.infradead.org,
	linux-imx@nxp.com, linux-kernel@vger.kernel.org, peng.fan@nxp.com,
	ping.bai@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de,
	sherry.sun@nxp.com, xiaoning.wang@nxp.com
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: imx93: add i3c1 and i3c2
Message-ID: <20231127022140.GJ87953@dragon>
References: <20231017194657.3199749-1-Frank.Li@nxp.com>
 <20231017194657.3199749-2-Frank.Li@nxp.com>
 <ZUz/8fBWtnwdSW9w@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZUz/8fBWtnwdSW9w@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_182150_795899_75CDBFE1 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 27 Nov 2023 11:56:34 -0800
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

On Thu, Nov 09, 2023 at 10:51:13AM -0500, Frank Li wrote:
> On Tue, Oct 17, 2023 at 03:46:57PM -0400, Frank Li wrote:
> > Add I3C1 and I3C2.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> @Guo Shawn:
> 
> Driver part already merged. 
> 
> Please pick up dts part

Rob had a comment [1] about SoC specific compatible.  That's not what we
want?

Shawn

[1] https://lkml.iu.edu/hypermail/linux/kernel/2310.2/03035.html

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
