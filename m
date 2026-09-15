Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8004C88E7D
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Sep 2026 21:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+jCwLi7ETn8xbhbVu9D3qwlt/ukD/BtM++qhD6vRjA=; b=KIAKfbKW7Jtt8h
	5SQNqunKGxvzukG9rx+GnW0OrTQ1vS9wpdVoQ6mzWiaP4ZPEEcPfAo+buDomkOxowi5gZGv7G5mEy
	fSK70lRaH+gIpBTkilr4a6+T7S3fZ4Onj1kr49Yr2ch+sdu478nMwzbyAWzvaisdSQNqx7HHvoGLZ
	7uHlk+3PVn1CsLHEhU5sp1sXvn8mwwZm5w+CMqBsMGWHQGo2DgHfnPmaseknfoCws+ebOU7wdUb3g
	NgiNhqELeiTv9PpWPmDUAdYHV+gAya4eJMLqz1Cdfq3lTcBnh1TloK2+TDW0uGdxaEpzHCHFkkImc
	4rhbHafArv8LONdLrjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6afR-00000007xyB-0c0O;
	Tue, 15 Sep 2026 21:26:17 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6afO-00000007xxm-2bIX
	for linux-i3c@lists.infradead.org;
	Tue, 15 Sep 2026 21:26:15 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d43da99easo2535417b3.1
        for <linux-i3c@lists.infradead.org>; Tue, 15 Sep 2026 14:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789507572; cv=none;
        d=google.com; s=arc-20260327;
        b=MWumkPvu0hLtVRxiG1p92AHQu1gv8Ar1V56uCxoEYmDUS6HcWTzembVkjHcDHuCOgH
         iWe34ZfihRlYUuAm24hID4/ixree1aHV+LjI8do80EK4KM7YigWkETK67FGfuOVyE8Ai
         43rKZUEGhSZ8uqhGkSjdPRKjPLm8RuEcnVcVoYQtJlToxe684gpvgoUCCfHKwAT6JcH2
         Qi9F7OG95TKOlcLNI11tS4yvggtic0+it26+SfATpEOA2FofIYiH2ZP8PG3f8KM8G8VU
         NXD9Ma3WkzwH4j/zQsHmPvcoDNIHjXqpD1RhBVXxJVXKwE+LSx6HzQVFH52qLKZmd6QS
         XMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=flx0ET5eBe4MPEWRVh5JKF0RRPdqvJFkwYU0IdjbLqI=;
        fh=s3TxNonMoZwDjiAx2FPIAGTcLL03jujasDabpl1W+lk=;
        b=WNEr8iIgjO/R4TYUu/c48dQKhR3+pgEnej144Nje5WFCImItVm+hq+N/MbLkMMKrzb
         Af3BrkqJ75VGun6bnfpazkLnC2cUHYzwFi/97xNxcMJfwEl+DVoX4yf5UfZzlkimRDTi
         jEpLOZnJiG038XoMMxhrPXGVPMS/9DCwZEUQww1G0PZW2cepw3BoAIrgwPE0tsr6RROL
         jA6JxB2L4I5NdMtZKfJvSPoDwz89OEZYAiYgO7NcC4WiENghaDnzIqjND3Vs/KmdcyHJ
         uK+8ZSMVTen6SpZxfhhAUj3jZKedbfM9qcpwy9FtGFif2zANF6v15Qml7KEjPMT9abBx
         ZfMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789507572; x=1790112372; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flx0ET5eBe4MPEWRVh5JKF0RRPdqvJFkwYU0IdjbLqI=;
        b=cF0ABQ+VGyN1NTIV9aog44OpNpOBMCoc5CiH18esk1Ut95NmjN5GxUpP8i+V1H+OzE
         UNYaabiJvWqcJtoQRy3MK+xSizSEZFulPonnx+HkjRQH9ocGWvLrQKb71rZ8983+gX0u
         Jtj9BWg2DgUAoq1JWHOZajj/IFGM//UcMM6LrIQ6S0KZd4BBVXiWBhsKZk6UIefLddgd
         VmuO1b+FzM4UTNnPHFG2S3iwbD88afqoJjVGQMlyHbssE3eZgihr3uRTWSdkGcyzKs8x
         FzQCB3p4qmfM/1yunnzpoNKHS81f6VSY8Rf7CBaWghnacKID1QklE4BDMInt9cE3BZ52
         pxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789507572; x=1790112372;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=flx0ET5eBe4MPEWRVh5JKF0RRPdqvJFkwYU0IdjbLqI=;
        b=epsR5SnS1cg/wzB2oKVDBoimsgLqp9OtxvrxPGrvXuFIDGsX28flGc48NhzI7Y9gfa
         SA0eY5WsZ/ofCwQp645enyxeHMDChQAXCOm7V+UkJW3raRYOZE/9bacgFG7C8UXow7oS
         cWG1VEzZtH6Uq83Gd8vzKtQfchFhysvDhAt0Pqf3VHU+owsVrw7P1UACBpqJZnS+pXtO
         7A8xMFsrGf6XTDF9sMDnxPBhO7EpsQMnfO/7Un3LBNW7TFuLA/NhmDHQLxKcvWOXROBy
         Sw+yacShle5GUrqwkydDWEKQBXjsiIJbgah1L3BVCmAmI8ofACNaDCinpP3mI0RWJ8+J
         J4QQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMJJ675P+ut1IPuoBUmwtZsK/ifXS+Q9JalYO/Z1GUt+fbzedZ8t4mVe/UvInZM2ojF1hBCNxItX4=@lists.infradead.org
X-Gm-Message-State: AFuF++mAWoRr1ZRvQtG6/dQoJ2p8WBilH+0yof6Z00mXErZwNAs88a9Q
	EG515D2IPn+HewbgArYEOCh73t9Ei6Im+EROmvyUW/F6zlFXsB0Vedz6sYGbh51un47yzlkQkyD
	97OVMWu3QpqEsXwC0bD8vBIJwV0+6uhdXi37Z5Nj2
X-Gm-Gg: AYBFou2+tgd0xolAIg5L1pEOlVzd9sylZxocLKmotXf4RIareQ8j2Lc8M7fGTtsf3AG
	deXWM7tHStmLJYQopns5MHHuiOe+rK30YeVsRy/bMr1q8aFRzf3WwgBLQ/EKcT8Wo8jD+d1fmDa
	ZB7jAUKd2ES7hcICyFkfKCS81/2lJQKxRwSpiVPhg6z8etdIxVcNI6HeyEa+8eijSRrhfuDCGnF
	9G35iGmwEfjKIKaGUn0UlEz0mViPSWuENvSqeCwHxgKegAZBT8shK3Ek+pWkTDdulJ5yCH867NM
	gncvJuS3uI6Xily6y9blIsn95QzeoFGUN/DEpmrzzJ9oZoZ4D0CiXluIeHzeSNKkn8LEcruJmHr
	Es/x7CXPzjruK25ueClFTQlm94Qwulw8LuOcN2xYERQ==
X-Received: by 2002:a05:690c:d91:b0:88a:a9c8:1363 with SMTP id
 00721157ae682-892213153ecmr1051727b3.16.1789507571445; Tue, 15 Sep 2026
 14:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
 <DLC6ERLST1B6.6K3HLH38DQLK@google.com> <5fb77c2c-40b8-4dfe-95d3-e0c73b8559bc@intel.com>
 <CAHreonHEAPrzhVH0AiAzrZOr+h8D=T8hB_oC0TP50d79y_OWSA@mail.gmail.com> <b8737b87-4dca-4d49-916b-f8e468e74a75@intel.com>
In-Reply-To: <b8737b87-4dca-4d49-916b-f8e468e74a75@intel.com>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Tue, 15 Sep 2026 14:26:00 -0700
X-Gm-Features: AcwNN1WBOdpUMxoXq3egK3z70CVN12lzDXX_aVg0FNLaZpu2jsmUtkBDsOU7hZ8
Message-ID: <CAHreonE32grASqJp1xgjvOW=1gi_xM2vj+pi5paG+s8pzc4t6Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_142614_669371_0DCA3FFA 
X-CRM114-Status: GOOD (  10.99  )
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

> It is less confusing if it is all fixed up in one patch.  Fix the
> comment on actual_len.  Make all controller drivers use actual_len
> not len for returning the length of data read.  And fix up mctp-i3c too.

Yeah, agreed.

For v5 I can add a patch to the series that does the following:
1. Clarifies the actual_len field in kerneldocs in <linux/i3c/device.h>.
2. Updates all controller drivers to populate actual_len (and not len) on
   reads, building on Meagan's patch.
3. Updates mctp-i3c to use xfer.actual_len.

Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
