Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53625CD4F54
	for <linux-i3c@archiver.kernel.org>; Wed, 20 May 2026 12:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fW+o/OFIn6iZueJkwrP1Xpr6oVwPUVerxaTQwCUH6q8=; b=hQS5RnsqMEGuwT
	XBCQAlgwXfrCxLzwP+8bYPJ07GELmk1X9ouQomuopFwmUYCA7TGwpBsmKfIMf01v2XkzWuR+K0sbJ
	la8aOrKs6YsCGUGc0mvy2h5v+yIBbahuDTiXExvXzvBaIjZmhf8p3+NbV1ZSRWRO5FwbsJC/6CxUv
	7FSWcbZrEFNzpR2YlZ0tWkzIp/a9vlYBDVrDn2f+uVKrlsYb+5X0SUe4QezdLGJph0iCoCPkquDYM
	6iR8naUqheKt1pzfr3bf0X1DEz/9ukp+YDpPW3Wg+yMvkNNwFCqcA5SxFYFmJY3fJs0DzKf8pZ1+a
	lpgUzX485lmZPfU6O2OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfkH-00000004Wex-01Rz;
	Wed, 20 May 2026 12:09:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfkF-00000004WeE-2ixG
	for linux-i3c@lists.infradead.org;
	Wed, 20 May 2026 12:09:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C25916012B;
	Wed, 20 May 2026 12:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014961F000E9;
	Wed, 20 May 2026 12:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779278990;
	bh=TaSBu7PS/Ow3nxZoQX6ddArOegPn6w3gky4WSoil6Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J0CDiuHT3XeYEgcM61cpBwzZejq8r7mbtHb/897cdVSLhCxRxmrLcGxMkJrfc3b2V
	 zC/006/MClGk7bq99pL6XujHAj5E9eqyNMQEwWoVQUqfyW9Wd8IP6R4eZSw2sTegP7
	 uxGkYjqq7RkjBibjFmksjV20rbzrHjn9rnO2FsbwXMNXKUJsoO9QMsyB4MNZOdpwuJ
	 Ci9Glkbm/R1empS+UaNQy6H/VQrOKKmxvTGLr/eToXux1SspVFN5LTtmy4x3a5Z/sQ
	 wUwS/cpfI5lIH65erLW4fNswECRYo8TpYH//PtEAIB6UpBA7xHZVf3yjXCFq7h0ioF
	 RW23UPkCl3Whw==
Date: Wed, 20 May 2026 19:50:44 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: i3c: dw: Describe core reset
Message-ID: <ag2gFB0BSCVUCVg9@xhacker>
References: <20260519055105.13079-1-jszhang@kernel.org>
 <20260519055105.13079-3-jszhang@kernel.org>
 <20260520-cocky-thick-wren-900aa0@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260520-cocky-thick-wren-900aa0@quoll>
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

On Wed, May 20, 2026 at 09:14:44AM +0200, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 01:51:03PM +0800, Jisheng Zhang wrote:
> > The core reset support has been in the code from day1, but the
> 
> Well, no. There was no "core" reset from day1, so your entire

aha, by "core reset" I mean the reset signal for i3c core. Not the
reset name. But I will update the commit msg.

> explanation makes no sense now. Previous version was correct.
> 

OK, so I will send v4. 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
