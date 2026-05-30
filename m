Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46A2CD6E49
	for <linux-i3c@archiver.kernel.org>; Sat, 30 May 2026 13:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqFuzgvTjhFQOl/wCQxSYYf6HLmBtQPQH6Ya++IB0C0=; b=iVfRcW/c3haDZq
	mu/dvPjqsJoeyoprCQnfqb+zzykCcXvKvHESWGkczi8zHuU0SU/yRHwgQ5JvNqIKHNbBPlQipTqGY
	O0iLHR+Jb+Mc1zHkSffh8wapHV/RFmTylhzUB7yp3+Ps193psU+bIwpgWtjqLF+G5RQfcQCEc4ie5
	Du7QkxLbf5dPR0JhOy0mhSDHQdd+wdSTqBG26QvFnzskoCiLM/aIF22z5lYoYRpcJZkZmyxQGbiQ/
	3vKyL8NFKsuZ6LCNbKJk0PDBeFcGrAzKoNGvES2C9FRAc/pqchClTWRhd4+QFmv70bq1jlNx4RDTR
	n6iKMaTJXRNsN6tmZyjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTJZW-00000008l1H-0Vu5;
	Sat, 30 May 2026 13:17:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTJZU-00000008l1B-3uC9
	for linux-i3c@lists.infradead.org;
	Sat, 30 May 2026 13:17:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D66D3600AB;
	Sat, 30 May 2026 13:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F661F00893;
	Sat, 30 May 2026 13:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780147067;
	bh=t2oLA32n49fw6YC2BTNEdxQuVC72zm9QzG8dufL6sQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AuX3B8qp2vK2JzGouTZHgXfIYXJvMcaIRuKiLFgBb+7iicYWZgc0cjdWjQD+sEVpV
	 ltAftx06JlgaOc4xhYQXcHjlPVKEd5vn+gQWd/Nj8ahx0T8r1Gx5PhDtDJRnjW4foC
	 GzYEGmJxg5oxQIiYuxpBnwaeEQLYJblpPKqAqFaxok8kDGfdw5azZdqiLfe3pJ8PU/
	 rcF3kOd9cOUMe+GJsR463yCJjgIw+lS0jptKSlVT8USufJgzHVUJ9I1kDIV7Cn/a/F
	 Oe4FJhplsohnWrpLK4ub+z5DRImEs/UMd74KD1VkK2aMOUVzQCzY3pmKjL0gDBkbTb
	 Srw2OwBZMX4Kw==
Date: Sat, 30 May 2026 20:58:35 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: i3c: dw: Add apb reset
Message-ID: <ahre-7YdlcOZkwS1@xhacker>
References: <20260525140018.19598-1-jszhang@kernel.org>
 <20260525140018.19598-3-jszhang@kernel.org>
 <f8efa4ae-76e8-4082-a445-ca5f6d230bf3@kernel.org>
 <ahZwl3uXjyOZRvGW@xhacker>
 <4a8539d3-704b-4433-b4d6-e5acfe22d512@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a8539d3-704b-4433-b4d6-e5acfe22d512@kernel.org>
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

On Wed, May 27, 2026 at 09:53:16AM +0200, Krzysztof Kozlowski wrote:
> On 27/05/2026 06:18, Jisheng Zhang wrote:
> > On Mon, May 25, 2026 at 05:25:45PM +0200, Krzysztof Kozlowski wrote:
> >> On 25/05/2026 16:00, Jisheng Zhang wrote:
> >>> Add dt-binding for support of apb reset which is to reset the APB
> >>> interface.
> >>
> >> And this is ABI break, so you must explain WHY breaking ABI is worth
> > 
> > This just adds an optional apb reset, it doesn't break any exisiting
> > ABI. Kindly let me know whether adding new optional binding is also
> > an ABI break.
> 
> It does. One reset was before. Now all devices must have two resets.
> Clear ABI impact.

I checked the dts with only one reset by manual dt_binding_check
and dtbs_check, it still work, so I'm not sure why those dts "must have
two resets". Kindly let me know what's wrong.

> 
> > 
> >> doing that or what is the impact. Additionally you should explain which
> >> devices have it. Does Altera have it? You really lack explanation WHY
> >> you are doing it and which hardware you exactly describe.
> > 
> > I'm preparing one of synaptics SoCs support to uptream, it needs this
> > apb reset signal for i3c. So you mean I delay this series until the SoC
> > upstream series come, right?
> 
> No. You just sent patch which basically says that Altera has two resets,
> without any explanation of that.

I guess you mixed other series/patches with mine here, no? I didn't
mention Altera at all ;) What my series mentioned is adding apb reset
which is to reset the APB interface.


> 
> Write explicit patches with answers WHY you re doing and WHY its impact
> is correct.
> 
> 
> Best regards,
> Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
