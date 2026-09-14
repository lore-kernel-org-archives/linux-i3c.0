Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE12DC88E73
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 20:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAgSKDcxMP2hxi0mgbi3vQUxvhBPimqzG/JVHvGn7NM=; b=uv4vZnINabyhBw
	7zyAThg1TOuJj+bnKs4VaoFbFoBftkycYROCfin2BjtjVOTZMRzoQovwTuNUz6/JTCphkigPrctRg
	4O0bLMzwGqSy+Zo9kCnOaDiBfa0tkuLp2J8qxb5zIA+ridV1sog2tUGnZCjttmQm+u5u7Etq9lFHx
	tx0Jg8YKcxjsBSGxhPi7EC+zqzEUuRUlRkxBhfGOjOoKYFhFAH0Mym/lccf30lV+IU24dcAbDRmgI
	0zQ5IY5zvx+EyNdsokVju9jOcwSRLBenjqL7hkyoMZ4/pZcqOm0Y0vic3Sa6k1NtGIRxa6MhYvNFj
	iM5OY7YLdo3if8nVZt0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dlo-00000004din-1O0c;
	Mon, 14 Sep 2026 20:59:20 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dll-00000004diL-2lks
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 20:59:18 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4aae314aso2314718d50.3
        for <linux-i3c@lists.infradead.org>; Mon, 14 Sep 2026 13:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789419555; cv=none;
        d=google.com; s=arc-20260327;
        b=Ct4QjxYVBYFWBsO9iIRNCFg4wRuiSAuz7GEkPVMgVH25rkZcvDQ3vLBVv60aSngEgk
         mbFIZoDrBrJ/IZERKm2IR/7Ook5BpMTullg8FYlnJ/R68gH1kgQb8W9SuHvGRQ1GttEq
         ZLbqEi2JxdWt+W8yGtB2NAR9JOu/pQ62rxPu6TFH+SzIglUhdp+1J3eGW67gkN/hFY5e
         pQ280RJDw0YA31ItdxP3pS7jsm+FQdkbX5jx7XaWn0LT72PuweoH+R5h/5NbBj9Fe2p0
         /FKb44hwHk84xuBpmKcZkWAz560qWU9HEtrHJl/TTdkveyswvFPHb8e6lKmX47t9wKi2
         Mfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zXHIkXlSRZsfmNsjhNyw93di5/lnalEzLNTnyiY0Yks=;
        fh=7SHN5vV1YgIMSUH4veKzE3jLbeMXmcB1o3DsSHXxqew=;
        b=YeKRHWmPFAKlq7bqJtvGP796kteKpnRg9+65eOv2RqTbO2fHoZcL66C7ZwjkVlW+NC
         hgfkRFgEgXfsI5vBSXNrFzP0dhSvWk9G78x5Z/MnE7LZSY3tZ5LbKzO+TB/CuDYdHWMT
         J1afOkOikM93v4RqZZcYYBvIBLTeDNgXRY6Igec2mDcLDWXvSfclpWWW39tYOX2486Nl
         sXXQAs0ZzpKV267QaylcGO5XWCZ9OGLCSlsdwPj/RgZAIuepfu2vzWCokNECBQCp/IPx
         NWUedcYHUI0gjM1EV6SbQPw7PV/Oi5ZAKApMGu3jvofgaVxs1DGeZDg1ptVGmxP2sI/j
         NOnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789419555; x=1790024355; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zXHIkXlSRZsfmNsjhNyw93di5/lnalEzLNTnyiY0Yks=;
        b=e0glx91aWw04uk/87Lossk9xdncHwS84Ja9ibUq79lgPapvT4KkN9PpoSOpQWzXJ1l
         QoietvgORzcvITOAiWuQax39OnDNNPWssZAXevbmEYohAHP/halbElgGgNMjOEyZxw4m
         dKsUb8q0KmzVkBCl3isnJ5d3bHVkgggjA8obKA/kSgpmTrE1mUXXtXsV43OpM5qFcXYK
         DfOYJV8YvGsLzKiWMsVGNtddFiNnYVUZ/dKuc26Elr09ttSim2AR9gBANqn1p012sRNY
         qHoI95edK7j068ah17mXwfwV02LLyvdEcTEySknVSxwx60Ti39DsCsVWeQIB7Of1d69X
         NV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789419555; x=1790024355;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zXHIkXlSRZsfmNsjhNyw93di5/lnalEzLNTnyiY0Yks=;
        b=Fk8+I6uQGY1ddfKlKwfcIK6ydPrEsRzhHpBhUD7WMruBHHPuS2/4zseGXkCrnWvP25
         aRnIjn7jD1EVtSMp8i8r6yzQFYQkIJGZJijftxjHlpzwcy+9QQu+cMVx+2YzVDB9A+vp
         IiTGhS6iLhgE+UJ/9CGS8AZfhwH2b1sAXNbJEHlZTIOTe79S+BeT8ui2iRoMGcsgoFvl
         bj3P6cYz63scbOOqmoCOH9p4EmeUy2CdlbcQYYZxE+q9zaAmQ5MY2A+1LnmZA2FY73EE
         73i/xUeu639p4UBv/6kX4dcntv9Qvhqoef8a2xqoG7V25dxjEKs0LODxETznpQ6LMHqg
         Mczw==
X-Gm-Message-State: AFuF++mfJH9E8qTpj3xKU/SMj294FJgg5GsWbmEF3F0guXaiHVc9KnY/
	QQV/Uc9zKh/VKMl5b4rDdOEA8jBcgXX60v7SJwjMrjmCzKEyae3tO6hdUNJJKA83DcqmOUaIick
	Efmi95od8EE63Q+WGJgrPOXU5DtDNBx2ooi49xx2G
X-Gm-Gg: AYBFou1Ke9Ld483NiiMxh9XAlgtqZPUKx/qxOIt76CfWz4vkILeTSxWu1/LZIeSCC7s
	wz6EvpEqc/5xUDpmE/T404ku1bbBpSpVhPO0FAEE8KHPyD5yCxyxhDOJHpUZRHQauNrvI2S6MN5
	l2sjjlZfqhZIeJLOs7xDfcKIbfrYdi97Lez0xZ+RMX9pf5b5EhGSa43m1JltKPvOrPyTXDRrjgF
	dN+3emznCwGmama+5POcif8T1MXvN1hOmcoaF2t3XwqWprh82uDcwiJ9jdhsfUXj3XiJqXF2/oM
	ZgFVOP5EJ7uHb7kw4Bigx2py+FohWhMsZvvVbGprIlSNfX70tO259I0DM7JSzElpVXctu/JkRSm
	9KgZHjW/bRg==
X-Received: by 2002:a05:690e:4106:b0:66f:c206:ce5c with SMTP id
 956f58d0204a3-6714e065236mr1515465d50.25.1789419549739; Mon, 14 Sep 2026
 13:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com> <aqUzq9MIS8hBFDtD@ninjato>
In-Reply-To: <aqUzq9MIS8hBFDtD@ninjato>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Mon, 14 Sep 2026 13:58:58 -0700
X-Gm-Features: AcwNN1XF8K5ytkkhsSc9MQM1N7ybF0zeDQt7mDN5z5dkxKGPpd2y9acjgqdJRV0
Message-ID: <CAHreonGf47y5_fjSWeXOZ4XswQwyfozTCww8=cKUrJoB_Jf0XQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] i3c: Introduce i3c device userspace interface
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_135917_704668_632FC61A 
X-CRM114-Status: UNSURE (   9.68  )
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

> An idea: because this project only contains 'i3ctransfer' at the moment,
> it probably makes sense to provide this tool with the Kernel, placed in
> the 'tools' directory? We can seperate it again if it becomes too big or
> we want its own community there. But for now, I think it could make
> sense unless you want to maintain this repo as well?

I think this is pretty reasonable. I can incorporate i3c-tools in a
new revision of this changeset as well (Given all the input, a new
revision will surely be coming).

Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
