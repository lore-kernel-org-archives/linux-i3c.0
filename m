Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D55C30653
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Jun 2024 22:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGWtldmnNyPRPeTDC/iuZaTh3ZQgNVk+HJeqm3fFTDg=; b=SyYprBwnXR8U7I
	meSPEch5FjJvRSdWQ9/ymAElADBSnf05ewKNJU1BwSVLdU2tY47ORc8IWPmJyikrDBg7xplmgl/Jw
	tEjHXXPhRlqJY09Wc7J+6NxWq2uPth7HqU9bCilAu6L70JfMCJCe8b9+/ncFhaF9iVFlnaiZCcEHW
	bJKuEDRbFD6VtXHU4dFOdbOQRIVC6RexUo/KG5JPY7XAnUXOEwloVlbeAclZinh/qdNeoehTRPgmV
	6ns9CBpVIBiaSSE/SLqZPg9zqOJVn6BYzINlryIyeEJn9X8icrPhybLBv76BRMla7tdKobzT3S98T
	MrBYJAxN1phnjsTAT4NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMxM4-0000000Br8C-0JUj;
	Thu, 27 Jun 2024 22:12:36 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMxM0-0000000Br7n-1kVc
	for linux-i3c@lists.infradead.org;
	Thu, 27 Jun 2024 22:12:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EC1EFF802;
	Thu, 27 Jun 2024 22:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719526348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=An5BEZM8QiDYdH3dqXe26yVMRNsjCS+5IhvPPev7uZU=;
	b=YmyHvdPaAmHd7NJs13uHNr7BxKk062IYv679uc9DFupHoLmaWhpNE2NEksbOFnj7sezzHK
	R9QjGgMkYh0QbEZTpxXSbxWVIw8S4i9KyPL6fe2D5NLclX6dxZYBVAYPJclzaNGvIRi9xb
	48uuN21ntvZgZlhW8uFI2w2lBb8/SxPzj9r2M28iMe2pFHntkaxdd3jo1cbLm1X3qPSywL
	/pxrhR/AfZUcoKlDCtQLdfu2zffwwGv3g40vY/+D3BHIXsXs8Vey8uKgWXIrZWmjmmXQtX
	D1dSPfcCUDOeapGfOUCQ9sria7xvA6LTbmkrA7Ecn0aW66GA6fyoAK+fSelFYw==
Date: Fri, 28 Jun 2024 00:12:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Aniket <aniketmaurya@google.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] i3c: dw: Add apb clk
Message-ID: <20240627221225e3517e4e@mail.local>
References: <20240611171600.1105124-1-aniketmaurya@google.com>
 <20240624052851.1030799-1-aniketmaurya@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240624052851.1030799-1-aniketmaurya@google.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_151232_615190_5D0FD79B 
X-CRM114-Status: UNSURE (   9.71  )
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

On 24/06/2024 05:28:48+0000, Aniket wrote:
> These patches add APB clk aka pclk to the dw i3c driver
> and the binding doc. Also move to _enabled clk_get APIs.
> 
> Aniket (3):
>   dt-bindings: i3c: dw: Add apb clock binding
>   i3c: dw: Add optional apb clock
>   i3c: dw: Use new *_enabled clk APIs

You should reorder your patches to have 3/3 before 2/3, else you
introduce code that you immediately remove.

> 
>  .../bindings/i3c/snps,dw-i3c-master.yaml          | 11 ++++++++++-
>  drivers/i3c/master/dw-i3c-master.c                | 15 +++++----------
>  drivers/i3c/master/dw-i3c-master.h                |  1 +
>  3 files changed, 16 insertions(+), 11 deletions(-)
> 
> -- 
> 2.45.2.741.gdbec12cfda-goog
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
