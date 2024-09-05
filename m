Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C68CD5BDF
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Sep 2024 16:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usgPRzO21KQX75QvfP05rT3N/6bDueCnb7oZObztJaE=; b=Xa0Oy+8U2pqJwt
	By2uezHam/Inw0V+EO96B8KDqIcN2R8af/RHFJzgMVN0xn9EQqsJqOsC3bQUkPTzW2rHQ2J5mJJKD
	7EbyADeu8/tpDNJ6DHTQIt9lngz09mPT3u1yU69jhESfqJ1fH58jS7/J4ppfFKqMDlO4Na2Nt2aMF
	BRuugo1TXOPaHxoCsu7stP+pCzzJowDG0Xvty+gGkG0BUo2CtqAz75k8Bv4wDmLBZcBIv3MMzQveT
	2/yagwzgSB4Q5dH/z7bvXRW8HqzVwFVqeMHoXj4s+PyQYcCp2sVmJyqsbJhkGhOb79Llq1lI8Nu5U
	lV5SZG68ge+jcE19+BSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFd3-00000009BbG-0jGS;
	Thu, 05 Sep 2024 16:46:41 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFcz-00000009BZI-3qmd
	for linux-i3c@lists.infradead.org;
	Thu, 05 Sep 2024 16:46:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 246A660002;
	Thu,  5 Sep 2024 16:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725554795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y9JHzPELaFvdfCk8t28Ma1HhiSmtRgZuuju1D+YdvBc=;
	b=UTjeX4IfKUOzgbt+W8oCLkRxz2+rQA2+rozP2xe3a98LGUzNvZ0o3rmg4ootvlL8H1Shhk
	xl9MjIk38iAcG7mjHxglQMbVSYUhJznIIqnH7kcwovTX0WuUgQ9CZiIlS4GwTUl85xKlp/
	uqAuGvRBIqM8DZc/FLs1Zv2BBmeVoSBclbKP5h7gYH+7V2//484eEB4Eq3OPBzLoR2ac5C
	ESqIWvwDOnt60xsuUlUoaSJC9+FH9+jI+sOP/+UIm0DbZC/QKURCv7bdj/9OrPuvxnP2G0
	i2t6iwUX/FvjNJOKKU0e/cCeJzHxUFZTbcrOtDI94/BymT30D4eqGmBwNa9wjA==
Date: Thu, 5 Sep 2024 18:46:34 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Liao Chen <liaochen4@huawei.com>
Cc: pgaj@cadence.com
Subject: Re: [PATCH -next] i3c: master: cdns: fix module autoloading
Message-ID: <172555478609.907928.16529000879792282272.b4-ty@bootlin.com>
References: <20240826123957.379212-1-liaochen4@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240826123957.379212-1-liaochen4@huawei.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_094638_139641_75FD030F 
X-CRM114-Status: UNSURE (   5.95  )
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

On Mon, 26 Aug 2024 12:39:57 +0000, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
> 
> 

Applied, thanks!

[1/1] i3c: master: cdns: fix module autoloading
      https://git.kernel.org/abelloni/c/133f67bea5e0

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
