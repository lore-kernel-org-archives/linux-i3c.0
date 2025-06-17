Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4405C71136
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Jun 2025 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/iLnz/WTMqxbnl0wO8YDrVwJbtwOATlw2ARJg1vM7U=; b=iQzi95PRI2F29Y
	XmeWifzdj64bGpqwWlQ13KM5Bvl8pJwgl+KXomeGrIIKnn1vVlxBdgQbFTs3cPWT4ebmqrRjkgNIH
	VWMkSgXwVivaagwQ32YTE+YjPHm8Olt2rtMk1yeRxGVdC3wE97gzNquzykluuoh39GWkK4G1ctbG9
	r9Xpf9fa4gFOZJMnXiUQcoKnRloir+aVn/Sy/+Ucop3czQ1EsPw87TueXbmly3CRcvGn4LCTJdKQV
	M1xbNCilCR+RZEDT/3ZoeCz0anfsOPFyww3+YCw23Q8iecuCzs1t0SLOOk0ddi1m/KLeTf8xdoReq
	uF0/e50e/2n5TCiMIthQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYsC-00000007q2a-283p;
	Tue, 17 Jun 2025 16:09:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXiD-00000007ebm-1wNQ
	for linux-i3c@lists.infradead.org;
	Tue, 17 Jun 2025 14:54:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-453066fad06so44194195e9.2
        for <linux-i3c@lists.infradead.org>; Tue, 17 Jun 2025 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750172096; x=1750776896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wOiAASZQ1fSoiMZFjqnunFPeJrMlMkcRR6CTRxTDfeQ=;
        b=idORJGY9PKGIJOpuKGibCt5V9uhq0yKMsorO3dSHSUvGA2hHLHSg9A6gqnHBpI3Gw6
         eAiQq8pNdMQhAUOIMfFLZ6KigEFBNu7MZobbbbiW2D9Jz/4aSYDPyhvRoqMSN4VUT0SY
         Ud2rb4CPnaBxwRIizEij2EfQ/3xWNnCF1XtrKJ2GGmwKFYUtzi3umYOcoe3I5rBdlPgN
         vrzLxZ9PXgtBfSm61R4vZW0MguPiHDG1kH+B2G6piXE1AvO2AwxriRzoDhwRT6lmB1sz
         4guNQ7n0OT+XoJOhUhTz4ZrpxCzMXRgxELizyrStmgq7/HFP8W12+R3UTh6PVUx2RVK5
         K1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750172096; x=1750776896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOiAASZQ1fSoiMZFjqnunFPeJrMlMkcRR6CTRxTDfeQ=;
        b=TyIIgjod4sZZ5beaelsPTIhOhGOzYLLK7l43z9I3t+YB2huoXuiXR31Jl4u1CQ93Bj
         bwpIv6SvVmRBEPlKcwlFZR4YIsCUP/MphNfgOstrQ3QhNnd2RabrggGxxfPxgn2dftfJ
         JeJfEPU7c6RCMH3fnWKbiSKoIGgzMNWflHiL06QB9KcLpWJV5VmxhQ1f0P8XZS+94gc7
         5Jztfd42vVbD+Q9fLNEwWDUglsfMlR8BwhDlYfxCxKIUiwQ3r1sbEjowwN3XpIUfIFdV
         9D3bIUzdRYUq2/tL0wumBicutkHi55vy1aeoEGGpWs8tM0u+wAz7B+wRPbdipFPzQmMP
         EN6A==
X-Forwarded-Encrypted: i=1; AJvYcCW9oj1dKzCi3w+doxgPTq9Gw8tW9onXwzP/pdZ3wqddW8XgaGhfrywQvUcY19uPoHubLl3Jy3Zxxvg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLXzaLcAZ6/aeKM7if1RtjCuyT16glrJDDcaDt2KYfvPBrbK1s
	KXH+ehGzTezoBpAjOJckWOiadPpEPLDTaO93Z+i46vPtNlgUE/688sOM
X-Gm-Gg: ASbGncu6zUd9m/ZdgMO/tlbgIjllRLuAoI0Oujo1yAv9gBhAMdgz0ETPqePCc0TAY6j
	+4JYJVyuM+CI60co67pdgYU7m9DO5HKGGy7uE9l9bUUAqW2ezK5uB/EZdscdwlMRPPWGcmuvzCh
	Q7jt4iZhdkA+JpU2d6O67zSD2dXhSl6seTkPuN8IL1sYsHFsUsmJQ1U/1p6H2JcmO8hCpu7uol7
	m/lXN67TuHGh01weXfQQdCtCZ58IeKWq5B6cdW4cpPnAfL0XrhfswD4WVF9UnoyIlfsP9epXM0z
	tb9CGiqhX7AUlyIMoQ0+rp/J2QPepARN0dVQ7Q1N+Win9feBzM35tlFZotKp1Mbsb6Ff773dtXF
	6Ihze/aQ=
X-Google-Smtp-Source: AGHT+IHp83XMB3hs9kIXUVOw1BkW7osPtl3xgqCJV23FdxhPgCZfxhcMaKwGJMNhPIpGaA1nHTlqqg==
X-Received: by 2002:a05:600c:6097:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-4533caa11ecmr140958915e9.18.1750172095717;
        Tue, 17 Jun 2025 07:54:55 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08dfesm14435672f8f.60.2025.06.17.07.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:54:55 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:54:52 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <i6lqe2n42gueqzs2xru4yk5jzlt766jsmoolhb2q3nnvbkz6uu@dijk4qihk37f>
References: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
 <20250606-adi-i3c-master-v2-2-e68b9aad2630@analog.com>
 <11b278ac-20ba-4e75-b307-6608ea8b4522@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11b278ac-20ba-4e75-b307-6608ea8b4522@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_075457_498397_68A91FA9 
X-CRM114-Status: GOOD (  19.36  )
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

Hi Alok,
On Sat, Jun 07, 2025 at 02:03:42AM +0530, ALOK TIWARI wrote:
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..b3799071573f4066eb14123c94ee599cc6331b3d
> > --- /dev/null
> > +++ b/drivers/i3c/master/adi-i3c-master.c
> > @@ -0,0 +1,1037 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * I3C Controller driver
> > + * Copyright 2025 Analog Devices Inc.
> > + * Author: Jorge Marques <jorge.marques@analog.com>
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/i3c/master.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define VERSION_MAJOR(x)		((u32)FIELD_GET(GENMASK(23, 16), (x)))
> > +#define VERSION_MINOR(x)		((u32)FIELD_GET(GENMASK(15, 8), (x)))
> > +#define VERSION_PATCH(x)		((u32)FIELD_GET(GENMASK(7, 0), (x)))
> > +
> > +#define MAX_DEVS			16
> > +
> > +#define REG_VERSION			0x000
> > +#define REG_ENABLE			0x040
> > +#define REG_IRQ_MASK			0x080
> > +#define REG_IRQ_PENDING			0x084
> > +#define   REG_IRQ_PEDING_CMDR		BIT(5)
> > +#define   REG_IRQ_PEDING_IBI		((u32)BIT(6))
> > +#define   REG_IRQ_PEDING_DAA		BIT(7)
> 
> typo PEDING -> PENDING
> 
Haaa ups, thank you!
> > +#define REG_CMD_FIFO			0x0d4
> > +#define	  REG_CMD_FIFO_0_IS_CCC		BIT(22)
> > +#define   REG_CMD_FIFO_0_BCAST		BIT(21)
> > +#define   REG_CMD_FIFO_0_SR		BIT(20)
> > +#define   REG_CMD_FIFO_0_LEN(l)		FIELD_PREP(GENMASK(19, 8), (l))
> > +#define   REG_CMD_FIFO_0_LEN_MAX	4095
> > +#define   REG_CMD_FIFO_0_DEV_ADDR(a)	FIELD_PREP(GENMASK(7, 1), a)
> > +#define   REG_CMD_FIFO_0_RNW		BIT(0)
> > +#define   REG_CMD_FIFO_1_CCC(id)	FIELD_PREP(GENMASK(7, 0), (id))
> [snip]
> > +
> > +static int adi_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> > +				     struct i3c_priv_xfer *xfers,
> > +				     int nxfers)
> > +{
> > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct adi_i3c_xfer *xfer;
> > +	int i, ret;
> > +
> > +	for (i = 0; i < nxfers; i++) {
> > +		if (xfers[i].len > REG_CMD_FIFO_0_LEN_MAX)
> > +			return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (!nxfers)
> > +		return 0;
> 
> this can move before for
> 
Oh well, I will actually remove the LEN_MAX define since the depth is
actually a HDL parameter. Instead, the FIFO ROOM will be checked before
writing new SDOs and CMDs.
> > +
> > +	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
> > +	if (!xfer)
> > +		return -ENOMEM;
> 
> Thanks
> alok

Best regards,
Jorge

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
