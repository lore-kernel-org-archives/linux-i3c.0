Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5240CCCF9EA
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Oct 2025 04:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpGbobrouE8jaFbXehtXzXooXvpQNc1E6rWNDy7Etfs=; b=gTiCeUf7pT0O0G
	SLta3Agv5Sizb2RzB8u6rygqco5ryLYtW9m3zOPN3Q7Jc8lbRl6HFcfD35IfMVnocZY5pKZZYT97f
	sKJFFImgkYUYfEyl8dbU4FQhZtc/hHWma4TzE+sk68L93BBH5UDE8nr8doWLEAsYzXRDmzuEW8ZmB
	Q0DPwrXW5E7fBpT6cg8CUjnubob+aT1F3tAN9Qm+/fhFjZMlPoLKmvWcfZGZdMtDdVeI/9g7M/MBI
	uGBd93VhjPVP4QqBiFayocm06UMQy8EF38mJJ9/u4wPj39hGsWBZuzHhaXdjI2sToAQ1/F39c8hvY
	E4CD/NKGG9hqZauvBR+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEK2a-00000003S6U-0LwX;
	Thu, 30 Oct 2025 04:13:36 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEK2X-00000003S67-1XRn
	for linux-i3c@lists.infradead.org;
	Thu, 30 Oct 2025 04:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761797602;
	bh=cJeYb9u6VkHP5W7lpdpCnObrTqkT19FaCQNUI3AOvxM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mbQNOEcMEYOr6a714d8/0UHWK2Tfp5+09uBZCVyu5LFe4X5BZhiiWRh1UOmoPlzW0
	 OXKQMr1hdEB2PwpHTjlZ+PrZ26hfEKYeKW2pYF1HvOlCXaMT03zgsbkPa2Q6XBuUE4
	 o+EfwnZa/zTHjgCCwwWNQFUWf2Fc2JpYSyV3XJKUD0JUWyTwsaYkJ5e+2A0qL9xnb1
	 y9c8+Wg4soZ9ekdXzUkaJCyUkjq8n8m4nvI8jDfjdwAoEuWQeHk4BwE7K9mECvSZr7
	 xZHjNOOSt1b3sV10tSLB2pSqZHNhEgr6h65zYc37TpK5f9l5N1q0wu+H8odWhw5+yv
	 MDNVxrZ/P+DTQ==
Received: from [192.168.14.220] (unknown [144.6.157.237])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D4C8A79118;
	Thu, 30 Oct 2025 12:13:20 +0800 (AWST)
Message-ID: <3b38dd392e06dc7d187c5bb247418bf189180a1e.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/4] net: mctp i3c: switch to use i3c_xfer from
 i3c_priv_xfer
From: Matt Johnston <matt@codeconstruct.com.au>
To: Frank Li <Frank.Li@nxp.com>, Guenter Roeck <linux@roeck-us.net>, Jeremy
 Kerr <jk@codeconstruct.com.au>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Mark Brown
 <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-i3c@lists.infradead.org
Date: Thu, 30 Oct 2025 12:13:20 +0800
In-Reply-To: <20251028-lm75-v1-2-9bf88989c49c@nxp.com>
References: <20251028-lm75-v1-0-9bf88989c49c@nxp.com>
	 <20251028-lm75-v1-2-9bf88989c49c@nxp.com>
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_211333_597200_A0D47C55 
X-CRM114-Status: UNSURE (   5.69  )
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

On Tue, 2025-10-28 at 10:57 -0400, Frank Li wrote:
> Switch to use i3c_xfer instead of i3c_priv_xfer because framework will
> update to support HDR mode. i3c_priv_xfer is now an alias of i3c_xfer.
> 
> Replace i3c_device_do_priv_xfers() with i3c_device_do_xfers(..., I3C_SDR)
> to align with the new API.
> 
> Prepare for removal of i3c_priv_xfer and i3c_device_do_priv_xfers().

Acked-by: Matt Johnston <matt@codeconstruct.com.au>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
