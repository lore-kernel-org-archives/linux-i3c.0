Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CF2C10F04
	for <linux-i3c@archiver.kernel.org>; Wed,  6 Dec 2023 09:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=thbbBN+/1QmvEdfOLY41ttjR4OEEiua7iYiC8yFRo/0=; b=LPy7s9XwMfX6tM
	V930UPWDIaeZXl8WmYNfzvsIIvMNPz2g7gS0v+QGBXXwNQuJwCW66UAbANvyfwmJwQduf9JRqMUPN
	5YWof6L5wlKwsQ58Poigw8t91LS0zxrzCwKUTNvGnMEguKefGl/kisjRxkJanDuFvdJQFXqqPAklZ
	XXKMHplH8UFUmxStLkad2u4InB5gCjkhtbPCQC7qdpuyQ4Nh3Y2NhpLNZpxP7FThhxyDEwEC9CGj2
	7GGVF9dsGRkGbZFeB3xOv10LDwHT9OSUrKN8Za0ruSsT3qXiChkvtuoEqdvhWmHaqcDzmt6vMr474
	U2MLptOKuk0z0+AUEWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAoFT-009Yrz-1C;
	Wed, 06 Dec 2023 09:31:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAoFQ-009Yqt-0A;
	Wed, 06 Dec 2023 09:31:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FB1D61750;
	Wed,  6 Dec 2023 09:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E184C433C9;
	Wed,  6 Dec 2023 09:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701855074;
	bh=IqMFN3NBD8fJEXGdzcsWRBm0VvjMfikWoLBOrHQyNEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/dbmKyHcbZUVGXY26w0XNpnZCrNhqu8i6kiDo3uOwXsDv5n7bGUhOuBMtG636xsg
	 JrvedZW3YS1XepPThc0ds5laMa4pywatIJlnEQtbOgPtWtZCwr+c69dR0xEw0AVzrV
	 F2MxX56GNK2fZ9wqA3kJPcFa8Z5YcNNzK1/DV8SqAlUzzQbRI+X0gxf8g9crYKUhUb
	 x8tV6SLWiAiky4+kZ3u4y6T8x6p7UgM0aOwnlHKySyYacpQIUV84okkEqRCErTZJuE
	 1BPACPL8x2+m3PFBQW4E4IuGRUTs6sFVFi/CuxftGs8sTAVtULGR/MnK4DAUBRAsmm
	 XKlaGY6EAZHzg==
Date: Wed, 6 Dec 2023 17:31:06 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	alexander.stein@ew.tq-group.com, alexandre.belloni@bootlin.com,
	conor+dt@kernel.org, conor.culhane@silvaco.com, conor@kernel.org,
	devicetree@vger.kernel.org, festevam@gmail.com, haibo.chen@nxp.com,
	imx@lists.linux.dev, joe@perches.com, kernel@pengutronix.de,
	krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-i3c@lists.infradead.org,
	linux-imx@nxp.com, linux-kernel@vger.kernel.org, peng.fan@nxp.com,
	ping.bai@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de,
	sherry.sun@nxp.com, xiaoning.wang@nxp.com
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: imx93: add i3c1 and i3c2
Message-ID: <20231206093106.GE270430@dragon>
References: <20231017194657.3199749-1-Frank.Li@nxp.com>
 <20231017194657.3199749-2-Frank.Li@nxp.com>
 <ZUz/8fBWtnwdSW9w@lizhi-Precision-Tower-5810>
 <20231127022140.GJ87953@dragon>
 <20231127-cherisher-falsify-8193656e8872@wendy>
 <ZXAKp1WS97cAI5X2@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXAKp1WS97cAI5X2@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_013116_133757_DA90BBC2 
X-CRM114-Status: GOOD (  15.46  )
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

On Wed, Dec 06, 2023 at 12:46:15AM -0500, Frank Li wrote:
> On Mon, Nov 27, 2023 at 09:35:39AM +0000, Conor Dooley wrote:
> > On Mon, Nov 27, 2023 at 10:21:40AM +0800, Shawn Guo wrote:
> > > On Thu, Nov 09, 2023 at 10:51:13AM -0500, Frank Li wrote:
> > > > On Tue, Oct 17, 2023 at 03:46:57PM -0400, Frank Li wrote:
> > > > > Add I3C1 and I3C2.
> > > > > 
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > 
> > > > @Guo Shawn:
> > > > 
> > > > Driver part already merged. 
> > > > 
> > > > Please pick up dts part
> > > 
> > > Rob had a comment [1] about SoC specific compatible.  That's not what we
> > > want?
> > > 
> > > Shawn
> > > 
> > > [1] https://lkml.iu.edu/hypermail/linux/kernel/2310.2/03035.html
> > 
> > Yeah, Rob's request here looks valid to me. Should just be a bindings
> > change Frank & fall back to the "silvaco,i3c-master-v1" compatible.
> > 
> > Cheers,
> > Conor.
> 
> @shawn:
> 	rob agree on "silvaco,i3c-master-v1" compatible.

Hmm, not sure I have seen that.  Here is what I saw from Rob:

"
The real problem here is not whether we have "v1" or not, but you need
an SoC specific compatible. Unless there's a public spec where we can
know exactly how many resets, clocks, interrupts, etc.
"

Shawn

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
