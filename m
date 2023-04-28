Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDA1C77B61
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Apr 2023 06:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9CY4iC77aDGEv4kHyddIfATfQI6U12XXUwW/tReWoA=; b=0sxoJpA++LYTzm
	9eK+Q8pMa3as5zJI0owmrR4xjA1i2Qgk0OThn/5txaGiMIqd9GN3WJ3p8+yjbIcLGko99ICo/xSGh
	tWDSv9fC2hxi/K22q+F/wRr35l5fo8aiCV0dFRXchOl2CCT9+TXBLuVdbzqBCEI+79oaj/1nqkvbl
	jFdFzjZDFoMIyfSVOgutp0J5tjhjiBSt0Cd70tn5nbjgtwX/kKk9PpmtD/g3tfnIHUf3Yxz/RjyYg
	QsmgWokjYCiwTvkSxo7KO7n6H9bdJHqwVGsaf167uj0X16iksdS7CmxOv8g0eXE70zZt5MuKDZLMG
	efqJgFCnTYdocFHgDYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psHxM-008LhC-1k;
	Fri, 28 Apr 2023 06:51:48 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psHxJ-008Lfy-0g
	for linux-i3c@lists.infradead.org;
	Fri, 28 Apr 2023 06:51:47 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1DB9320007;
	Fri, 28 Apr 2023 06:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682664701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgosnGAanu8jVoPS5HgYAEW6wOpUn06hmIKph9p7pVQ=;
	b=Fa5QRnwlzvAAUrf5t17rDzfElQdCotqU052gVQxToD3ruvEQ2j3lW6tLFuB7nlf0+ZHnEL
	0tk37ZE5B13QoIizhvQlE5ydwDryr91arfL31lSI7K2sVB3BTRAfeWwOrKk8wAk0imie6+
	zY42cHHoNAa5IntNAgR8BXY6fyYzNbb0Wgml8wXOWnyRAdTWk1Bb3ZnXTiRX7rIKPgl/u0
	mM8uQcRBSpSuN/kLKx/JGaVPhi7z4RUhQ+TajMNlo4QrkyyU4R4o9mKnZlOuGc2gj3i+39
	tUDc9dQtxGw/3NibuGCrg36aK+7Bp56vWnmOsaqrBKkId5IFCO/5Kq+COXx6Pg==
Date: Fri, 28 Apr 2023 08:51:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org,
	Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>, Jack Chen <zenghuchen@google.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 0/5] i3c: dw,ast2600: Add In-Band Interrupt support
Message-ID: <20230428065137097609fa@mail.local>
References: <cover.1680161823.git.jk@codeconstruct.com.au>
 <202304272235234c8f3955@mail.local>
 <cda6874790ced41cbbeca5b5dbfe39be869fb2d4.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cda6874790ced41cbbeca5b5dbfe39be869fb2d4.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_235145_432599_2A94215E 
X-CRM114-Status: GOOD (  12.61  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 28/04/2023 08:01:39+0800, Jeremy Kerr wrote:
> Hi Aledandre,
> =

> > I'm sorry about the late reply, I've been super busy this month. I'm
> > happy to take this series but it doesn't apply on top of v3 of your
> > other series. I guess this will have to wait for the next release.
> =

> That was originally based on v3 - I think you've applied v2 of the
> ast2600 series.=A0
> =

> In:
> =

> =A0https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git/commit/?=
id=3D7dcbb33d3b2b8bd903d3157fc7249a4cb4f6820d
> =

> your linux-i3c tree has the v2 dw struct, with:
> =

> +	/* platform-specific data */
> +	const struct dw_i3c_platform_ops *platform_ops;
> +	void *platform_data;
> +};
> =

> (platform_data was removed in v3).
> =

> The Link: tag is correct though.

Indeed, I fixed that but this wasn't the issue. Patch 5/5 doesn't apply.
If you look at the context, it has "struct ast2600_i3c_platform_data {"
which is "struct ast2600_i3c {" in your v3. Also the chunk in
ast2600_i3c_probe() can't apply.

I fixed it up and pushed, please check.


-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
