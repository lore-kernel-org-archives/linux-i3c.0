Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A42C71145
	for <linux-i3c@archiver.kernel.org>; Thu, 24 Aug 2023 20:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zot6bNSyDXRA1bqBNR/Vm31aPkJnJ/yM7oh3gWwgvc0=; b=gNlAxOG2zvsHKF
	0F5lXKnFwvS1dpd2ARbFFH4obftTERV83I3SRu357oTdR3k/UJ4X9JfwuMwwtmDisLF8PdKMPLNyJ
	kyIGqBG3mRtBtD7TeyAVCP4uRqmLpGyuhKfvaSYgAT+IxCGlyryJz+BEtJnxeJEVD+TSzj9+prS6m
	IvEmjfP1yodq7gO+s0tOObe8dHdDfrzWQ5L0ToJ/U6kuhhiju+LvTuuK6hw3W0hgzAfl4EjQy8JRm
	2c0A0MUr96yxLUbkXwSESmcse72fjKHf0bPLiwbneMacevYHYpOQj3mpr4hdjlkrqDYjGGvsRsFbX
	9+5OB9+rlmJOVmlj5T9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZGw3-003k6o-2c;
	Thu, 24 Aug 2023 20:28:07 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ0Ws-0020Ga-0s;
	Thu, 24 Aug 2023 02:57:03 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-76dcf1d8957so92910385a.1;
        Wed, 23 Aug 2023 19:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692845818; x=1693450618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9Fv6zMHUmxIJtQTWw3otja3eb7daBbRUnAPWR3+Kws=;
        b=EVi36tdUqJMlOvMF5BKp2qBduN+pjKuz6Us6qWN0euQMxX//FBn2tkevUvmQ0jT7dy
         QIYTSLIrOwJJrbwKo9ZkDfR2N+fo2G2cnY9a7T0gyOxaEX87NC1xNeL/UwLcOFtHALic
         ZLiva7jbc5XlX1Ewghy60+GynWZHY461VYZBL+rKjJr0gJc6PhtDfsvnnfDKMTF+nmSY
         b67dYc7Ry1QTt8dSvag7E3m3wxL+T/zxdYaloB7x8dxtgj588ko4UqYQcmY36CHVtxWt
         iYF3G4mM3FFe+F+/+nyQoaPThIAVJk/g4AuxUBKaCu+vIZtlOzjd8HrBF87f6fV68U4J
         kBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692845818; x=1693450618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9Fv6zMHUmxIJtQTWw3otja3eb7daBbRUnAPWR3+Kws=;
        b=XguAvnaUsVO9aMtmW76OYSs0AifTrPkxfBHKxBCPshWQhzYGilP7AmYCQ5ozoVM71p
         64Y3pk48vD1G1ShfFSwO8UlwFOPdp97+poQe00l4ivrUxm53X1sNIc4m6KqobR8Po4Iq
         lWiLnpCR1QACtqBB0o+gIgOw0d8/QVg+Mige9YDsbWhpEhivglUnpYpuREWprpMhZBEE
         u+DWQcjuvxjdDYsNhxzEExkprgQ5Ec4PtwxTTHkI6A1lJHHQKSUzOtTeGKEEPphckend
         4M6vTYEulFEfdHYJ2yPfOt/1uRI6mCkaTzyiJowVULKAef3cD/0cXMa40ff9BmKSfqcz
         SmBA==
X-Gm-Message-State: AOJu0YzGEcrE+ViwpB7W6ortXNjTPqt2mSpOWwWvVTdk+iRzMxgDSu+t
	UwuIecQlcgTXfYhBb80eXI0=
X-Google-Smtp-Source: AGHT+IGfrlLR+AVm4rNxdl7JpMbBTxVzD5wv8rDFBbxVFAKSvhzmEDzdpW59h59MCcReusMlyP0fPw==
X-Received: by 2002:a05:620a:290e:b0:767:261d:1ef6 with SMTP id m14-20020a05620a290e00b00767261d1ef6mr19366337qkp.59.1692845818303;
        Wed, 23 Aug 2023 19:56:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z137-20020a63338f000000b0055386b1415dsm4743735pgz.51.2023.08.23.19.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 19:56:57 -0700 (PDT)
Date: Wed, 23 Aug 2023 19:56:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jean Delvare <jdelvare@suse.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Corey Minyard <minyard@acm.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	M ark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
Message-ID: <0f6ee9b9-3792-4865-8183-c50d4f3896e1@roeck-us.net>
References: <20230823183749.2609013-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_195702_336339_43CE6DFE 
X-CRM114-Status: GOOD (  10.97  )
X-Mailman-Approved-At: Thu, 24 Aug 2023 13:28:05 -0700
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

On Wed, Aug 23, 2023 at 01:28:47PM -0500, Rob Herring wrote:
> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/hwmon/iio-hwmon.yaml         |  4 ++--
>  .../bindings/watchdog/toshiba,visconti-wdt.yaml      |  4 ++--

For hwmon and watchdog:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
