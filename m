Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF7AC27C53
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2024 22:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Peg4zMZiQmIK7L3OZDWuP35gqx6tXIT+ycSFT9bVzJ8=; b=EB2T4ac9TZbZwp
	/i7TNo0jFrwoTWFPz6GX8nw3lsbm8VWGRrWlfsqWb8fRDpaPcm1bnXyJREzy6F+HrijObQ1NVW8Gv
	MP6eeaz1yYAht8HV62XJz77mZrud8hnv1i1KDGNTiFGbJALwUt3rOdPIiznymibn7RYq9pSkn+DMr
	spTNc+BlqqZbtlKkyMDt9EQF1yISaVRRzdNRekkgtC4wj6wboWDfMl3Q/XfAOy2o7XnzwVHIjEC/4
	qZ1QHSVi2DA/V0i6+pGxCTFoFrDlXmE1dvI+y92V9lL8diGv+BDsqPy9N4k8+tZonU7GpS+5WU9a/
	NzPosVZ08BbyNFYXkm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9Co-0000000CvGl-2VAQ;
	Sat, 22 Jun 2024 22:27:34 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9Cl-0000000CvG6-12fq
	for linux-i3c@lists.infradead.org;
	Sat, 22 Jun 2024 22:27:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7EF11BF204;
	Sat, 22 Jun 2024 22:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719095246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=50DF7I6vU6d2IC+95xHyR+CKeEExnUgWF7or+j27i+U=;
	b=NlCcKNaTnU1o0nZkB/r7PiQRsSjMo7bmw9qoJlGBBK3VLTBxiwH84OieBNGV2hud/OHGnH
	/k/5yWrDXfL0Ww+zsf1KfneUwpTY85Wbm5sqB0eKXXcxjij8eHadBlCFbxqRt0Xzl30sxh
	na9K/hyklywesPFPTCgk1iEVSYzgMFu2etxTRF8DfjM0qyaeXy65UBJhfbOE5W/452U0wJ
	ou4o8fBLy9GzAfhdUlv++3A1rYgGsU/5c7LgmSyjAPnB5kW/BXfp64f5xhbKpEiRI8UqEv
	J6hynucOlRw9G0hca58vzP2+huon5lwJk0NIHtde4gOsJRM5veJFH1WF/mgNtg==
Date: Sun, 23 Jun 2024 00:27:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Aniket ." <aniketmaurya@google.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: dw: Add optional apb clock
Message-ID: <202406222227157424f82d@mail.local>
References: <20240611171600.1105124-1-aniketmaurya@google.com>
 <20240611171600.1105124-3-aniketmaurya@google.com>
 <202406182005584f0deea8@mail.local>
 <20240618200932858a6e40@mail.local>
 <CAMmmMt21TAH3Vp8axtY9PoM0K6gzQqtMiHTaNGXKPW3J2DJF-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmmMt21TAH3Vp8axtY9PoM0K6gzQqtMiHTaNGXKPW3J2DJF-Q@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_152731_452512_5B165498 
X-CRM114-Status: UNSURE (   8.80  )
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

On 20/06/2024 11:42:25+0530, Aniket . wrote:
> Hey,
> > > >     ret = clk_prepare_enable(master->core_clk);
> >
> > It could be worth having a look at devm_clk_get_optional_enabled
> Do we want to use *_enabled clock apis for both core_clk and pclk?

Yes

> 
> Thanks,
> Aniket
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
