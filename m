Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75387C77B7F
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Jun 2025 15:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMm8zSAgZ22Wbl/48O83NlraSDhQTmOTFj0wA1SqCaM=; b=mrsBZuL18oj6y4
	tPbeKAsWrEX6XqqPT8012gF9lI4FVfHvZP2eyf+Ivf1kWiNcRNsxxm0MaKEQvsiwiIH6MQ8ta9LGu
	krNmscjW8r2e2+9j9zFLCb5sIB5Sm7YtLTVErL2HfbZ2x9VLqIvw9WwqsFbArHj9EnmCTw9WBmt+A
	FZ3sjRcHvjmS7z8MdU3D+bGdNPddN8zweky0gbJm0BgDTNURVcT75GtEH9xy8pEsPmrcU+7nRoE/W
	Rl4P35qzhFQyAadqP/m2ipLtuNRQl36Vm4+U6/1RmWCVwpXrwa+IxSy4rg1qN5NtC5OkiDonqoQMN
	jKaYShCfhRZlJKrNJPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAqs-0000000F3Tu-0y95;
	Fri, 27 Jun 2025 15:18:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAON-0000000ExeE-1pAf
	for linux-i3c@lists.infradead.org;
	Fri, 27 Jun 2025 14:49:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA8FD61435;
	Fri, 27 Jun 2025 14:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77CDC4CEE3;
	Fri, 27 Jun 2025 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751035766;
	bh=7w6aib36RD+Q4FxhteWwo/GmIX4Y6wvc3f/T7vDzvwk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RPomRV2FqQp+leYnc9kJdzq/gYpnJjPNvCAEJOsYnQmVifbJ0CL+KBSCcJj5nPo/h
	 0WPtLVOgx5SH5+zt7Bpx63rhN0tW26y/ePWbOSqkT3GtICA//RdkuC1sHID00zwVnH
	 mh7MIExYeWhtnwKckT8dSKf1+bMYffaUSx/Qv1Nqzi44UJBKEKCq22nHAlLQEzpnmE
	 b3sI+ZjhpVer1ZS/6fSDzagnXlxKSfinTvlrjQOLgUke4vzepNdKLyNQpQEcPtxsB2
	 MV0EnPR6gm76elp1gKMgLtG9/4iIN8BsvTTFIvmrTmYyzj7NcyvAnKJgKoYWrvOXH2
	 IwAy4hxvSedSQ==
Message-ID: <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>
Date: Fri, 27 Jun 2025 16:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
To: Jorge Marques <gastmaier@gmail.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
 <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
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

On 27/06/2025 16:38, Jorge Marques wrote:
> On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wrote:
>> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
>>> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
>>> core that implements the MIPI I3C Basic controller specification.
>>
>> How did you resolve my last comment? I don't see any explanation -
>> neither here nor in the binding description. Binding description is
>> actually better place, I think now.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> 
> I forgot to condense out discussion on v4.
> What about this binding description:
> 
>   description: |
>     FPGA-based I3C controller designed to interface with I3C and I2C
>     peripherals, implementing a subset of the I3C-basic specification.
>     The IP core is tested on arm, microblaze, and arm64 architectures.
>     It takes one or two clocks, axi and i3c. If only axi is provided,
>     then there is no clock signal to the i3c input clock pin and axi

This is obvious from the schema, drop.

>     clock drives the whole IP. The compatible is suffixed by 1.00.a
>     foreseeing future controllers by Analog Devices Inc. and breaking
>     changes.

I don't understand that. How are you breaking any changes? And how
1.00.a predicts future? I don't think this reflects previous discussion.
Why you were asked to go with v1.00.a?

Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
