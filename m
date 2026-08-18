Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68382C5DF7D
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 18:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROPuHr6asC6Ra21CKZkXsAdZOonV0uz6tB09HYgz+3U=; b=M9Yuvo+FRXDrYZ
	ku4hVGGZ0R5rvkjDCL2sIKVJXofoc5HZQ5n8MZECnXmYlsvcim9BTIwnXoHr4whQKSKy1F/+HBmBm
	MhDKBIKdoNF0ujwFWq44NCQ9+zWWU4ZbJ8Tg6WF51cjN5/ktx8+XGURsX/Y03fXH3v1j/29EfgH4s
	4K1RSvESJwhGMhdrFZmFUlwNeaht5CjdYP0eYMnApCvX4HzUR7ajC27gIe37jB3K7sgkkA8JLHMZo
	MniBFwPUwgPcvG4plH23ekL3lgv3BAPGKEntID3tCZh9f4re6CMISKDv13JBYYma/6TJZ4udVhUH4
	KIQjRRxlaHK0ZPFaC0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOfh-00000008Wk2-44yt;
	Tue, 18 Aug 2026 18:36:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOfg-00000008Wje-2H43
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 18:36:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C159443FA0;
	Tue, 18 Aug 2026 18:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB411F00A3A;
	Tue, 18 Aug 2026 18:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787078183;
	bh=A9mXS+iJVUsw92UWSziKWYvo91tAw/CK264YKrO5MVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IxaO7vlRbvHAPJ0xLeaaVgKPuqrA+PCEdehPTNbizUfYL790go3Ft9Mxi8uPGT77A
	 wT0O9YZ8z/BlzKOQaElXaR/4CXd2OdErgsfm89NwtxRgJhwJ6RNFbt7aG+AB6tu3Wr
	 sXbkcmmL69VQ3/f3X8AJJkoriIux3qWEdnMkf0G9Xy4jXMircnMlbXelzW2CSh50nE
	 JfQ6HJOzp2mQAuLt+nTGa3bssEXEwKVlD1HjHVgFTqiZ4QfCXn6PYAi2+61EDpe6cW
	 4upssjf4wCmkXsnfvfIYBbmdm2aNLvblF7UQGl+ZnCSAIUfFVClNfUNTe0tNHGFtww
	 66NCZ7HJimO8g==
Message-ID: <003fbd61-2e3d-4a31-9b92-60dfeb3bee34@kernel.org>
Date: Tue, 18 Aug 2026 20:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
To: "Patil, Shubham Sanjay" <shubpati@amd.com>,
 Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "git (AMD-Xilinx)" <git@amd.com>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
 <20260817-spry-attentive-hamster-ea3c0f@quoll>
 <372395b9-be14-40c5-984d-3d725f20cec9@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <372395b9-be14-40c5-984d-3d725f20cec9@amd.com>
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

On 18/08/2026 14:02, Patil, Shubham Sanjay wrote:
> Hi Krzysztof,
> 
> On 8/17/2026 2:20 PM, Krzysztof Kozlowski wrote:
>> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> On Fri, Aug 14, 2026 at 05:21:53PM +0530, Shubham Patil wrote:
>>> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
>>> IP. Describe them with two boolean properties.
>>>
>>> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
>>> capable design is always IBI capable as well. Both events are reported
>>> through the controller interrupt, which is therefore required whenever
>>> the capability is present.
>>>
>>> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
>>> ---
>>>   .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 +++++++++++++++++++
>>>   1 file changed, 23 insertions(+)
>>>
>>
>> So the same SoC using this core will have different synthesis options?
>> IOW, why isn't this implied by a specific compatible?
> 
> Yes. This core is not part of the SoC's fixed hardware: it is a design
> compiled into the FPGA fabric. When the core is added to a design in
> Vivado, IBI and Hot-Join are options that are turned on or off, so two
> builds -- or two instances in the same build -- can use the identical IP
> version and still differ in which features are present.
> 
> The compatible string identifies the IP core and its version. It says 

Well, you miss SoC compatibles so you cannot use argument of IP core.
Although I do accept argument of two instances in a SoC having this
different.

> nothing about which options were selected when
> that instance was built, so it cannot imply the capability.
> 
> Thanks,
Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
