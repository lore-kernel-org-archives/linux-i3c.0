Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4028BC77B6D
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 13:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEKDU1GOf7SojPTamfOeNZ302Iyfw9VcMQMFeKFGXiY=; b=u4wvIydUGY2qQO
	h/3G9/8uaEREiT2SnQxOGM04+XHoE/eWp204P0GMzhkFC8VUX/XvJ34KHg9n+g3ET1o29ckiXlPZu
	DabJ0ZWRBvKeskZga013DB7fedPLPRx8peKqntCQSC11gjm4q5+IiD+Ze947cywsNXSm53ycyzkMI
	0VMqMpbIjbS0zf9yrrLL54uI4JLoWPoe+1wIXMd4OQ7hzamiyaj6WRzkiOwXut9iYXsB4l7ffuV17
	XFi42ozjYHdF3mZb8n5xGUCJqb7Ejju/nrZ7sEn47SSqpBtdq1usNVpxDTiuoHhO58c5I/CxEP0YF
	qCSxYna04OP5xJXqlgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phscv-003vV1-2g;
	Thu, 30 Mar 2023 13:47:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1php7I-003O3l-0i
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 10:02:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6F444B82101;
	Thu, 30 Mar 2023 10:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54ACC433EF;
	Thu, 30 Mar 2023 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680170565;
	bh=zYPO4y3IYH/8LiC6/JYISKwDvS9kR6ID5FFAEReR6+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r38abtHtCFwIuCBFgu8Wu/qsdnj0hexCUlNqOHq6km1ks/h/XD2FLyUBl7+LKUBqw
	 GP/deyrMD7lTRAxBvh5IMrhmgq9ITQf/U1zNoLX/QEaB/H/8Teb0HQU1K6PcFtCvLS
	 /SKHHQoZlZVjXIkopQ2NNW3bi7h2NlsXbk1h3yC7QX1XjBVqSQ84l4O5KyuJCA0qYP
	 Dt1lyaqGQmdvQg/Vv4QkO6ASXQH12edHhPjfVqAMii2BqVOJhbRCtDWqAkPJpVyitH
	 FAiE2l3oLGZGA+VgERgeTm334FniNNm22xMX3ZbJlq8uS9KrZoCE5HWpEwIAZG6L/J
	 ibzXiLVPJfxyA==
Message-ID: <bf8f3a1b-a4c0-d22a-8c73-11d59b595c4b@kernel.org>
Date: Thu, 30 Mar 2023 12:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/3] dt-bindings: i3c: Add AST2600 i3c controller
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org
Cc: devicetree@vger.kernel.org, Matt Johnston <matt@codeconstruct.com.au>,
 Vitor Soares <ivitro@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jack Chen <zenghuchen@google.com>, Billy Tsai <billy_tsai@aspeedtech.com>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <cover.1680160851.git.jk@codeconstruct.com.au>
 <f567ce86cf9a57b50320c1b2f7c851adc03c094d.1680160851.git.jk@codeconstruct.com.au>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <f567ce86cf9a57b50320c1b2f7c851adc03c094d.1680160851.git.jk@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_030248_435505_63FCF7A5 
X-CRM114-Status: GOOD (  12.18  )
X-Mailman-Approved-At: Thu, 30 Mar 2023 06:47:39 -0700
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

On 30/03/2023 09:22, Jeremy Kerr wrote:
> Add a devicetree binding for the ast2600 i3c controller hardware. This
> is heavily based on the designware i3c core, plus a reset facility
> and two platform-specific properties:
> 
>  - sda-pullup-ohms: to specify the value of the configurable pullup
>    resistors on the SDA line
> 
>  - aspeed,global-regs: to reference the (ast2600-specific) i3c global
>    register block, and the device index to use within it.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (on v1)
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.


Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
