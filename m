Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDAEC83013
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Jun 2025 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0oXgQ7vixCoBceSPG55urPJsCkL2diraDQ3tBqzRG4=; b=fss5KQoHDKYh3g
	CZAb8d+gKcZPi27XWBDhJCf0625OT4ifU/8LuP5Tp2G7hc5yEOd/cBFFVQY/+IQLa2g9sPSykbXMp
	xmA7t5x6Q8N9ePHr6BKqnSH98mLwMRVsLB5HWKjWVjoTRtYmHhKk4ioJgTySZJyDaJFYNuQdQhDZT
	CrgJGpeHGn8lkOSA+xl2M6RmYPnd2fOhHE/8FjDTiqzBzXe21ZvcrjZslOraUkzUIBoF0QgUER9wY
	LzA0gpr4YQ+OC6H/2ZtZzEwTj9jpFvpd9yP0bZ10GjtCYNycunPE3q6vwYaFK8rBKRQp5i4QQYI5S
	dUU9q93PWNKHzZwCsipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAhk-0000000F10j-2OVk;
	Fri, 27 Jun 2025 15:09:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVADU-0000000Evyi-48qH
	for linux-i3c@lists.infradead.org;
	Fri, 27 Jun 2025 14:38:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so2162131f8f.2
        for <linux-i3c@lists.infradead.org>; Fri, 27 Jun 2025 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751035091; x=1751639891; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LXFPDRZXg2Sq0BTog03BA9peluKkUONk23HYcVvvGXE=;
        b=HJVrNvti++vLfrwqvsg9HqTf4qh1YyQs/xwm3nT4dli0iVpFYL9DEfSrnttYF7sDxc
         EpER35cptZg1GFAxq4w1GPagflxHDve9+Mf2Eom+KUFwrMYicrCaukg+WV0o/aZgWNRh
         HChi/PE9x0xMhROw5peKuGZSdEi1me7GAQO7xLUX8X+/uEjkVBUFjJt+MnoSIn2YPE7o
         1sgbedhr1KhT/QiMxCEH252ujJ0L++aGQWuHe6hFAODzRszxUuhS1g5/P+Rp6kqUBuf5
         DJQEMa7hNkXj8Wt8xIZycr/ZEXXsbBSRpHNxHAQYEKP9aKM/sg4rV1zEvp2f8waBoMqQ
         JnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035091; x=1751639891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXFPDRZXg2Sq0BTog03BA9peluKkUONk23HYcVvvGXE=;
        b=tAXPY1Rna87y3GQ4dj66acQw3m18cqWSE76yijRdRq0xW+jQ2tppJVvz6jzbx++0EM
         LitlzdgJWjlDPZfH7vX9h8J1dn32XNV+UjlSYAoX8lGWgVuJZOHad9gTIkNSajzFKTOA
         BnNvUn5PXKpDmY5+lFxif7B96Ti9Ycg1DBwGX0Cs9O5U+ItsNkjRppVpAqsOHUpWSqoG
         3aLjjOKcYTTkndNhbQrfo83PwGemd/olvhc/LqC0fEf042Lna+Q9Lj6WC/vp7/F4IzPE
         VnUuT2aQRfdEZXSyU6y48iwF6hpzziVlbCSN4g2KVG9IrqH/Luy+MuDpZAViCs8Q+QW8
         wRuA==
X-Forwarded-Encrypted: i=1; AJvYcCXva8Z7putv5iNhtsoXURSQkkVOQFZ9tvZNo143WcD2KkDKTdQKZDpSW9lOuLVQur8FL2GqW0e4ZSQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzerV5D9f+z7cW49jmZex8/54UwXifNLMSh8fpUnM7OZmL18p2o
	RWiWALtFVqMsxpH4sBU1hYkQab4psfQNJFvfbRTs2QNVMrJUNqwaQG/3Cdf0cEfoBEoMLY+Y
X-Gm-Gg: ASbGncvKZGmpEnp+MyN+5fwRkpXYhX3VhTfytURqm2A6qCnCfck+ShcSEmiB1rl9E4h
	oxph0hBUoPfkadBApqVLvbtcCjytNkO2z4a1T/WvE0b4Kn349KM+dCpyVMmXx5woNBFHPLzBWCD
	+Ry52az6T/AJJ4q/TY0mIMk6+ZHxh1WD/kF2V18g2Tf7ZcpQZjv0vlyobUe3KeIwlV03C3/QaRc
	f43meJJFYz0y04e0lYc7V57Ok79eVzCX58jRW6t2FCF7w2qtbrsgoyLJnmcdqd/eKMfFeciElhY
	xl45oDMo/Ge+L1itH+BhSuAZu8yupfd2dPocUqMVhtSgiJSSZXwDDY0N2XAeJO/VTf6my1LAorH
	dXKkbJHk=
X-Google-Smtp-Source: AGHT+IFA8C9HjgL0OjYL5rpABof8IlYXB8y97W6UPPn6Dh1c8uM6AVaOlIm5wlhtCjpIGGKm6HCM7g==
X-Received: by 2002:a05:6000:2082:b0:3a4:ef8e:b31b with SMTP id ffacd0b85a97d-3a8fda34eebmr3434181f8f.24.1751035091324;
        Fri, 27 Jun 2025 07:38:11 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4064b1sm53521945e9.29.2025.06.27.07.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:38:11 -0700 (PDT)
Date: Fri, 27 Jun 2025 16:38:08 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_073813_025681_FD4F975D 
X-CRM114-Status: GOOD (  13.69  )
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

On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> > Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> > core that implements the MIPI I3C Basic controller specification.
> 
> How did you resolve my last comment? I don't see any explanation -
> neither here nor in the binding description. Binding description is
> actually better place, I think now.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

I forgot to condense out discussion on v4.
What about this binding description:

  description: |
    FPGA-based I3C controller designed to interface with I3C and I2C
    peripherals, implementing a subset of the I3C-basic specification.
    The IP core is tested on arm, microblaze, and arm64 architectures.
    It takes one or two clocks, axi and i3c. If only axi is provided,
    then there is no clock signal to the i3c input clock pin and axi
    clock drives the whole IP. The compatible is suffixed by 1.00.a
    foreseeing future controllers by Analog Devices Inc. and breaking
    changes.
  
    https://analogdevicesinc.github.io/hdl/library/i3c_controller

Further, deeper descriptions are available at the linked doc.

Best regards,
Jorge

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
