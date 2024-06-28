Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A4CC3064D
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Jun 2024 14:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e53M1TzE5hA/o6o5KBUcGFgwwIYNWybnLAECmqSJ2ws=; b=wSb5v0HyOETL2v
	gzb+SItrZ0F7Y+sO3ZAXs53DVB+0lfyu4IJxTUeXeisqmoOoMt6je47aHzhAj+E5fTcWd0KWKR9pS
	JQLM7B41wcXMol/k2nQtaDj/gjvd1rbntr1nIDdtT4NXAWaGeMt1O8pzkW/zyPYydGHZuZTO1l/Tk
	YS/JOKwg3Sv7F7fqRGX2R61Pt1Zhb6OujhPwSE+nKD/2EbFOrrEZ3+i+aOzPF1J7pJLDYyVcbB7Iz
	NeiZf8qT64NSSr5AdUtAhhAn9MRV+YX+KyOpz/raDA+0jndtGZOjI3KU47dIwtA0A2b/m71LY7nA4
	IARemPVR/hVGhX/eGK4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCo1-0000000E3fA-31re;
	Fri, 28 Jun 2024 14:42:29 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCny-0000000E3eK-2HXW
	for linux-i3c@lists.infradead.org;
	Fri, 28 Jun 2024 14:42:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFFC240005;
	Fri, 28 Jun 2024 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719585744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m7ea4kmKcikkES0WNMfRQfsZ+2a9duf7JBAbjCQyOnQ=;
	b=Tlad5y/H8bdOachduaBKU4R5BYHxv0bEm2ywIweD7tt9XzOmnTK9eV8oo7NxXhPc06qlnu
	7hhHVczDwC5lZ3D9zb8F8I4DRXsWo7WYJnuj7JbRGl7rm8p5oyapiheXrL/Yhi8P7+Q79X
	D2+ywY4u+5jgv3mNTCw4TiPZTHhCCy3F161gWe12WCa8IlMQwPTKIrbvmcZzbMmgHoj3E+
	WLcKNFElYl2vwKQ1RVh2IHNIN+aCQkkkNak6p2QGzLky2SVw+uKouQkql6gVIeYJN2gXkS
	2K0KaTaxJOxS/vX23bT7wVY0NcHN3U3wwhRp8r0Fl0crgms1PEqBm+yRdJUFZw==
Date: Fri, 28 Jun 2024 16:42:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH 1/4] i3c: mipi-i3c-hci: Switch to
 lower_32_bits()/upper_32_bits() helpers
Message-ID: <171958573314.36946.4255548725545268636.b4-ty@bootlin.com>
References: <20240628131559.502822-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240628131559.502822-1-jarkko.nikula@linux.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_074226_735812_DF9BD55B 
X-CRM114-Status: UNSURE (   5.98  )
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

On Fri, 28 Jun 2024 16:15:56 +0300, Jarkko Nikula wrote:
> Rather than having own lo32()/hi32() helpers for dealing with 32-bit and
> 64-bit build targets switch to generic lower_32_bits()/upper_32_bits()
> helpers.
> 
> 

Applied, thanks!

[1/4] i3c: mipi-i3c-hci: Switch to lower_32_bits()/upper_32_bits() helpers
      https://git.kernel.org/abelloni/c/8b4813a33a4b
[2/4] i3c: mipi-i3c-hci: Set IBI Status and Data Ring base addresses
      https://git.kernel.org/abelloni/c/a95d8fa46962
[3/4] i3c: mipi-i3c-hci: Error out instead on BUG_ON() in IBI DMA setup
      https://git.kernel.org/abelloni/c/3b85c83cce0b
[4/4] i3c: mipi-i3c-hci: Round IBI data chunk size to HW supported value
      https://git.kernel.org/abelloni/c/67678602c4fc

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
