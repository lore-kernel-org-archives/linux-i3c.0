Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B87EC83000
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Jun 2025 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8USaMsFuOjNbjFZlqxc6SSELN8kQVTtRYaGUa+3yP0s=; b=mTHxb6nAZBPAc+
	fgQKXG4L8E0+ku4Zzy3xCRrCaluKToFweCOEfkDjX5lyXdpqFFmxUi47Vr9/mjEgDd8eGvRs2DRqp
	ABiOcUpCBh6JcYlJb3UMRWUDUZDw+ttamp1RI+AVoNadBYf8CPN+O/S5sV3S3y/8Jylibjv2ckASI
	eP83wcva+wjUoQKNNmcF1YTSdQn5ezk5CG9TRfQS2HlJAYz6Wkdx4PJOvk4aXLtMD0r5/NLSXbgN8
	2SI4RcKNZ5PHHCvHKV2MKlX4nPZIDIDc0fK2qSNPjQclLNVLaIaoXbHnH11hUJDAFbmaxQfVniQUY
	eMOqu5tiTNVOtokm7s4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCjG-0000000FOCr-1evB;
	Fri, 27 Jun 2025 17:19:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBX6-0000000FCmL-2pQ0
	for linux-i3c@lists.infradead.org;
	Fri, 27 Jun 2025 16:02:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso15261725e9.0
        for <linux-i3c@lists.infradead.org>; Fri, 27 Jun 2025 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751040151; x=1751644951; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KyLLRbISSweC81aqmpyBtxhoJFl2pqPLdoDYJV2N3oA=;
        b=AD8SdBlZuB3EuUKneWfFSSddES+uWcbQPRBXKDhnbVioCKkSHyZaTSWhyTs5CTMI0C
         /ZK/DSFJo642MS5kXUx/ZIlzK8PEsoj8O3emSqv5T8defutGLY8CSzvb/uFS1hCUV5ij
         S28wpWgXew2vBvPmqRQ4TrfQmu2DNISZjmxfWmFjfzVd4rcYJaDk8+U+Ryf24cyBcU9K
         GOblP0tlH/+il1WY81vf2iwkkRcIjAzXqsYLohjd3AsBMaFsx53g7Qp0/aOXe5KAHQy1
         K2dCTSn+30gCELLEPyuAJJKKYkUaR4JFetSBvvm7ic9WkX4K9mYdu6AGoHax93VY0Mku
         GDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040151; x=1751644951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyLLRbISSweC81aqmpyBtxhoJFl2pqPLdoDYJV2N3oA=;
        b=rG3HVL6rSr6kuZXQmjX2lIFhoEl3UKdDsZxDY+ihScK0cQT06RStuNV7hgLdshW4Lm
         4RYRhhS0Y/KIQyc4URVS47U3dZZ7G9+fhYnEhUhYxOUWamUmJs2n2QY/2sSMqoE+zDrn
         OuO1Oyai11cjeLp457OeFMscigRABqxVhoiO7dSYIU+asREArr8rY20Q+as6F8LbEFzU
         4/Kbxcip95Dr5y9z4Qfd7Vs37fWK2HigZjO4seqVwY4pP8ay5CMZf/Xk12bxGJasyXf7
         a1pVkDJsiRklw6396X8hsQfem47f7y7BjKWnLwowLZ7IvMEiHJouUTfBGWg1GY5cZd0t
         nQiw==
X-Forwarded-Encrypted: i=1; AJvYcCWXB5tBaqHfSXj84kFqXwXQO7LBZBAIYd6hEMptGDdBxIJ7W47jOx6djcszrOdX3m3mp9Bt/uqrATE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAJ4a3cuG536gT6KzNLnNYWNmIMa/x9pp7MtowRoSWtSeOW1+e
	SwrLM0ByZXDSktrRCYglIiqWCHIW9Hj8REcwKdZ15rLmYFT+rpIO8NhBJu25JXv1Feg7rPNW
X-Gm-Gg: ASbGncuhWzbvI/VEyicnFEZVdJfAYXlmRQgyWjG66wwjyqMZNiGkLlYks3fMk122X20
	LWmJTDtLhTUFPf/kR/sPqJuz9+aBWwMcG5hkvpMqdx0uvCzYzutceHjd/Se4qqtPNARRkxy/OeP
	4ya/RdXIg/P/aneQ9l+lO8VQwN+z+XQjCuICtlj74tYzVVJ4CMf+BNIV1MjV0VFq7nRhH0zxEYq
	nC7trjB/6PFVmUiKYgtea0AIyK9XsB8UkJy18KLEeDywt0DY4htkEgtGlra1NA9IUgOF4NmrUmf
	Z4BXJLVC52z0cG66PGeI118XHEGRERZv9fVm8+NMrOl/003lAGlSukqRSDQfSToFG+9Z3Q8HRrz
	5B7wgeI4=
X-Google-Smtp-Source: AGHT+IGO7G80owL1UgXjlNkD6fOUWrTlmMT/3NWx91C6Idl3MW0ZTwFQqisHo2CQ/VPPMeqo+HL21g==
X-Received: by 2002:a05:600c:8184:b0:453:92e:a459 with SMTP id 5b1f17b1804b1-4538ad600f0mr72891895e9.16.1751040149634;
        Fri, 27 Jun 2025 09:02:29 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a306a01sm57556615e9.0.2025.06.27.09.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:02:29 -0700 (PDT)
Date: Fri, 27 Jun 2025 18:02:26 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <cfi6rzhco2ba6pcbk57l7tblimuks5jnpgaly7nbedbrpyhtma@u46if22kurwk>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
 <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
 <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_090232_711629_3E700C11 
X-CRM114-Status: GOOD (  21.63  )
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

On Fri, Jun 27, 2025 at 04:49:19PM +0200, Krzysztof Kozlowski wrote:
> On 27/06/2025 16:38, Jorge Marques wrote:
> > On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wrote:
> >> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> >>> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> >>> core that implements the MIPI I3C Basic controller specification.
> >>
> >> How did you resolve my last comment? I don't see any explanation -
> >> neither here nor in the binding description. Binding description is
> >> actually better place, I think now.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > 
> > Hi Krzysztof,
> > 
> > I forgot to condense out discussion on v4.
> > What about this binding description:
> > 
> >   description: |
> >     FPGA-based I3C controller designed to interface with I3C and I2C
> >     peripherals, implementing a subset of the I3C-basic specification.
> >     The IP core is tested on arm, microblaze, and arm64 architectures.
> >     It takes one or two clocks, axi and i3c. If only axi is provided,
> >     then there is no clock signal to the i3c input clock pin and axi
> 
> This is obvious from the schema, drop.
Ack.

> 
> >     clock drives the whole IP. The compatible is suffixed by 1.00.a
> >     foreseeing future controllers by Analog Devices Inc. and breaking
> >     changes.
> 
> I don't understand that. How are you breaking any changes? And how
> 1.00.a predicts future? I don't think this reflects previous discussion.
> Why you were asked to go with v1.00.a?
The -1.00.a suffix came from this discussion:
  
  https://lore.kernel.org/linux-i3c/ildi2pup2zkyv4stuknkrjysex3yzsbrrsrwbgcc4xgvdhwrdd@7qh4y6mutgy2/

Other adi bindings use this suffix. I personally wouldn't add any suffix
unless told otherwise, as I expressed on the thread. Should I drop it?
or suffix it with something else?
> 
> Best regards,
> Krzysztof

Best regards,
Jorge

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
