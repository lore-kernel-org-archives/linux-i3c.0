Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CD2C87FCD
	for <linux-i3c@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4oXKzfKK1ryMAjEer1145u0jNLUadBgzE6xo17Ra34=; b=NZrmqtQ+K59WNb
	jfuOsevzUjnYV17FynVdwoKLE+QFPKUfPIYkQV4GEKqtPI3vZGYRLzZQKf3vdbLIDELBct/BEMCkx
	Czhp/Ix+wDemPpidZ2677AmAfNzXZnORFUaIVQh8KolYhTH3Tvq2X7LoRQTd/ODrNwzYJtu+lT9Fd
	2RPeZLjsCa8cHJBX1NbC2vGKG8wxX5hYwfwy3MWERCsGNYeT5L8Q2rs6/tEA45DD1reNo2p/nrAWD
	3BN74wcH9FhL8UoRBzI3BxeLmkh+Zo6d1YYJlkaPF5+UjyBUFhCGuzrEyDliaxonMFsZWx5BQ69+R
	TucSKCzs+kTDpDoTjGWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewNF-00000007ZSJ-3qBC;
	Thu, 24 Jul 2025 13:52:42 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetOk-00000007EXz-2y7S
	for linux-i3c@lists.infradead.org;
	Thu, 24 Jul 2025 10:42:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so522329f8f.3
        for <linux-i3c@lists.infradead.org>; Thu, 24 Jul 2025 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753353721; x=1753958521; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VuhuHbBmeifTsbb3fFBxEKhPdDmR0mlneU3PFRFcuhI=;
        b=Rf/woGVSt8d0BX7lewGo5q8di83po/wwbzjJ5F+PvQZV8uYPsA9bYZf3jR9wpaoMHy
         i47UfSVkvFCWrsUAysft6a1Z7h4leG+HP1pte7/qqryoSdTo4c0wFMR3ro4vj+dH1tPn
         E4ZYwr+GVLzsmijKyxk98e8BAsjmRovP4UcjhtUqmgFBKreZ37XCOngcADLO76MmGk1E
         fSVVjnZz8mz3urSYBkZBXeFOVS3AiN9dp5FK9yHHzAO15gkv9h1u/hJTno4EU+0x8S5w
         6VV1xYSgyHetqKlXruRPi7H/NdKYKN2v5WenZvHHgXiXtcOhSYXEW78LQ5x14ABqvpp/
         n9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753353721; x=1753958521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuhuHbBmeifTsbb3fFBxEKhPdDmR0mlneU3PFRFcuhI=;
        b=SVe8TLPXwvfOSGi99yF31HA0bfwCkVyxycWq3Vm2LS8xx+2iaOE2ln9Vm7tqnbj7L+
         OhlFfRJCAE3eqtszQw+k6hZZ6VUabZSGDIUyvoyMiHgsP8prPTJLI5EI5th5KxPCef9L
         HNt2rGCyl5aRaKxXbU1prHm5OKXQDzh52iRnZ9J1wRYKA1glKT7NyCz7vNLh845c7ubt
         4MLh/b9F9i8Oo5DMv1OOMLyK/Dy2l57IpC3OVeWnf3wTtsS/Qm8br0e/MGsPXYveypfN
         dVUMCcynJ/zRujkfe5OJGycp5+7yFMl+gCo645TBgK2NcbVRcWd1auOZRGuEWekpVcSG
         H4eg==
X-Forwarded-Encrypted: i=1; AJvYcCX2MC5hdvPAzlPheH0zHaoTMyHLOyouFsE2Qn0Ug138Lv5tB7xW+30d4e8eH3oZwJRjehW5X0V5CPU=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywny9az2V6kmdxEJLs/9zcz+tYnRMz78A8jS5yaa/sm4b8HNl69
	jENXI6v2ii4mP0JRIKlY4/Apr5U1MPipLEo6pGsM2Jvra6GOaQi9CnZJ
X-Gm-Gg: ASbGncsaAlsKXJC4N6QsF1rgbnGH8ydjpW0zJAx57bWTJqAvXqhAH6hg59fY1McCMyv
	+NwchkLwkvolBoKow9yIMd9T6eEnLB5mZz4L2I4jJLNft1P74H+ukkkmU0Quk3BWMq/882bDuSl
	jHymbMiwJI1cfgHx9VvjhIQYBI3CVya5VUt/CIrdVLAQfjmiqYvz49eGisCBF2Cm+d+SgM+QGqI
	CmAKyCS6fpA0iWZlYQnHxfsKkrHYkiGmbYfVmdNAoFZq3s6ua6PJg2Qvy98mqf3tAkzw72ShCX9
	/Nis9ihaLA6kSSu07G135nZuBvQXq2OJB5bHXMZSrg+cTLzeQFT79WrExysIZJxgW7kUYnnMzDs
	DkItNl5pc0hl+JRNeUzmCg7c2SPMtHtaJv2PzLnblJ1Khx0OifBohaA==
X-Google-Smtp-Source: AGHT+IHev4fUzCaklvZiT4w7bm1C1QbDRx77ancF77FzVoueNZXiu6S14A8hR65jLlLCu51WRc4AXg==
X-Received: by 2002:a5d:584c:0:b0:3b4:9721:2b1c with SMTP id ffacd0b85a97d-3b768ee078emr4914068f8f.6.1753353720183;
        Thu, 24 Jul 2025 03:42:00 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45870553c78sm15344185e9.15.2025.07.24.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 03:41:59 -0700 (PDT)
Date: Thu, 24 Jul 2025 12:41:56 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <7bbopefg4ordtycyoeqijegzzhypqj7w6l7gjkacjl2hz6olce@npzdsv4j6eto>
References: <20250717-adi-i3c-master-v6-0-6c687ed71bed@analog.com>
 <20250717-adi-i3c-master-v6-1-6c687ed71bed@analog.com>
 <20250720232726.GA3055763-robh@kernel.org>
 <20250721-large-daffy-vole-d2d25d@kuoka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250721-large-daffy-vole-d2d25d@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_034202_750868_E13394BE 
X-CRM114-Status: GOOD (  34.58  )
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


On Mon, Jul 21, 2025 at 09:37:39AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Jul 20, 2025 at 06:27:26PM -0500, Rob Herring wrote:
> > > +description: |
> > > +  FPGA-based I3C controller designed to interface with I3C and I2C peripherals,
> > > +  implementing a subset of the I3C-basic specification. The IP core is tested
> > > +  on arm, microblaze, and arm64 architectures.
> > > +
> > > +  https://analogdevicesinc.github.io/hdl/library/i3c_controller
> > > +
> > > +maintainers:
> > > +  - Jorge Marques <jorge.marques@analog.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: adi,i3c-master-v1
> > 
Hi Krzysztof and Rob,

> > If you want to use version numbers, they need to correlate to something 
> > and you need to document what that is. I don't see anything in the above 
> > link about a version 1. Kind of feels like you just made it up.
I will need a week or two before resubmitting the final version style.
We are in the process of reviewing how we version things in general
and how to comply with internal guidelines also.
For the IP Cores, it was already an internal guideline to use semantic
versioning, and I am making it public here:

* https://github.com/analogdevicesinc/hdl/pull/1831 :

  The IP cores typically should follow `Semantic Versioning <https://semver.org/>`
  ``v<major>.<minor>.<patch>`` format.
  In summary, a fix increases the patch number, a feature the minor number, and a
  breaking change the major number. The first stable release version should be
  higher or equal to v1.0.0.
  
  Device tree compatible take the major number prefixed by ``v``, for example,
  for *axi_my_ip* v1.2.3, the *compatible* is *adi,axi-my-ip-v1* and the
  *dt-binding* filename is *adi,axi-my-ip.yaml* (no major suffix). Per the last
  paragraph, *adi,axi-my-ip-v0* is **never** appropriate. Software drivers parse
  the ``VERSION`` register for feature handling across versions. The patch number
  shouldn't have to be handled by software drivers, if it seems necessary to,
  consider incrementing the minor number instead.
  
  Due to AMD Xilinx old default IP core version, many IP cores bindings start at
  1.00.a. For compatibility, the patch value is kept, but should be treated as
  decimal instead of character.

(I should have had put as a dependency in this patch submission).
The dt-binding major suffix correlates with the major version it
supports all v1.xx.xx releases.
It takes time to get to a final format because versioning may mean
different things to different people/scopes.
The PR that bumps the core to v1 is here and should be merged in the
following week:

  https://github.com/analogdevicesinc/hdl/pull/1724

At the linux level, should I add the following to the
adi,i3c-master-v1.yml?

 +Description: |
 +  FPGA-based I3C controller designed to interface with I3C and I2C peripherals,
 +  implementing a subset of the I3C-basic specification. The IP core is tested
 +  on arm, microblaze, and arm64 architectures. The IP Core versioning follows
 +  semantic versioning and divergent major versions are not compatible
 +  with this binding.

or create a dedicated file for ADI IP Cores with the guideline?

> 
> I asked already at v4 to document the naming/versioning, which was a
> result of one of previous discussions, in the binding description. :/
> 
> > 
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    minItems: 1
> > > +    items:
> > > +      - description: The AXI interconnect clock, drives the register map.
> > > +      - description: The I3C controller clock. AXI clock drives all logic if not provided.
> > 
> > Is that a description of how the h/w works? The controller clock input 
> > can literally be left disconnected? If 1 clock source drives both 
> > inputs, then the binding should reflect that.
>
It cannot be left disconnected if the IP Core was synthesized for 2
clock inputs (1). The dt-binding reflects the topology dictated by the
synthesis parameter.

(1) https://analogdevicesinc.github.io/hdl/library/i3c_controller/i3c_controller_host_interface.html#configuration-parameters
    ASYNC_CLK

How about then:

  +      - description: The AXI interconnect clock, drives the register map.
  +      - description: |
  +          The IP Core may be synthesized with a second clock input
  +          called "i3c" to drive the internal logic asynchronously to
  +          the register map. The absence of this entry reflects the
  +          topology where the "axi" clock input drives all the internal
  +          logic. 

> This was explained in reply, but never made as proper explanation to the binding.
> 
> Jorge,
> When you answer to a review about uncertain pieces like that, usually
> outcome of the discussion must end up also in new patch - either in
> commit msg or better in the binding itself. I also asked about this -
> documenting the outcode - in v4.
> 
> Best regards,
> Krzysztof
> 

Best regards,
Jorge

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
