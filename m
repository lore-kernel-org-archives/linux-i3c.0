Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57090CA0FF9
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Aug 2025 15:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IR/or8S+sixMqyGJdF9z7t4q2FqD1qe7c1dLT0htoag=; b=SsW1fyNCWf3fXz
	4NbcIhPxkBriL3duUmtVkmK0oA6OmkyAMYQ1DWOQ93kmbrbiZ1dtjfaofePNbDJG6zCiuveL+PGDg
	Z2jaiJ6Gzd3hviuZa1DzyIA/M0MDnGYr/DIvH5b2a2iRExyxFu161Y2esEfWKb556rhMtZ5CBave2
	SwhuTSiwTH15TcUMywwHb5xPr1OhjKMsES0zglNiqn+I6HZvX0PfF33Jgpfr/XljXlJvJzCeOTsNG
	xxSoN4DyLGr779HrsvbL4SjXiPTMcGToUG3Bx5rOedlsN7aDgqQWuGl1VcvEXpnIQHlgmTE7EIALI
	2hC68Jj8Ux8TxRaws4bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIQb-0000000G0sL-0ShS;
	Wed, 27 Aug 2025 15:51:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urF3j-0000000FOdi-0tFa
	for linux-i3c@lists.infradead.org;
	Wed, 27 Aug 2025 12:15:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45b5c12dd87so32557535e9.2
        for <linux-i3c@lists.infradead.org>; Wed, 27 Aug 2025 05:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756296922; x=1756901722; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=deWal6fGTmJIA2DRBxXQwsqRR1CnN/qtvwinddrGd2I=;
        b=Ut/o/uQDnkvhll61QLFEusLTPPKOaRzPKHRhPQ+LM5UpCDwXBlMvihdnJzRBc+e6Hc
         oukXSgpelYb4hEiCzqVgAK4fDqeSyekzpkDU+2hVkFOzzl8WDqJOVkRfRLw5u/cVaaER
         XfySBFbQHGem7O2Ozny3zoI1qVavZNcBBoqHYbw2PwkNg1qr5WBW+cI/kcA6CXP64OIu
         767gYR+TizV6CmFECSWyAEgqz9HBSdfhBuskmQrN32wwbyWaZb6GIcAz4Hh6OXnklHcp
         Iu6o20DKNjVYru5DVt4qjbplOXMcNLDH4r5b3bq+LohKAlkKHre9Ak9gM+GsmmGDjN2w
         fxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756296922; x=1756901722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deWal6fGTmJIA2DRBxXQwsqRR1CnN/qtvwinddrGd2I=;
        b=Q33/2rlBImdzsUa8gMbPJugEl7FEdp2u6oxnwTNlCmB/eh5z93WETvI/S1aNZV2kUl
         27TWkNBaPBG2cDFUrZr5Cxlzp4HuZ8BFStWVXkNELlKUChipMsQ+s1QGED/YZmg8AnIg
         IGfXqgUGQ8TMKKqG8vdNVaHscWBUPtLRhPWPZWUOJXnRjz72NseNib1y/L8h3ork20Av
         VZxAqJx7B5mv8EQVQkuANrlzGOyhKUuFIP/ELtjuf6B4htTvtM1/LXnpsa2j+8yDe8JC
         lgFTQHNp0Vipnn7MfxH0fB77vA/utdQ80hYDyZby4pYE+lTHIhXhsquVdtB/SUqmQfdx
         nhdg==
X-Forwarded-Encrypted: i=1; AJvYcCUpAvOUBWGiTSj/WVYaHaGtSCIcK85MScw29AuO6eOaVxav7fRQNumH3tkapGaEwe/a8MRcUe05E7Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq+/GP2ACn4YXRskXHgvuIvRMJ6APkR/YgyGT/gvkRbZZdhOTL
	tj/P05PQZ7cmSLSvEuCenqpD7/ZhU/zq+SWhlzuG22leeKMUfrgBP//X
X-Gm-Gg: ASbGncvvpwfDxr/+kVbSRreMDhk/9layRenSIWHOSpNIQQ7H9Voh2BADR/dv8rLP+9c
	Fxk4pHUojn2F+Ayf9XNFbLkp131b5C34pgT34vFPeYeDsXEwj4efsQnLhQ11TrO0+l7kScR5aXk
	QbtTUZZRMZUpmbevS9FzT4Vy/rAaCeocF/vIUMwykQnihbQBqUNnNkYfcHk5G0Dxy/z4SIfKMN0
	3dH3EAnGptl+asn137VAYXfoE/7Bx5pLVG0gjwJk1jucZqycEky3cih9R9hnAhOwfmX1CWk+k+0
	rhUt7gwf77d2Vz3zrwc8xxCrAn+0TKPh6RuHWnyLceK3MpqMgM4Mf6hp+r3wLWPpjajSAd7Vcf+
	3vUXasxSYeZ7jtsefBwwiMd9rdT4Xcx0r6s2/TT5Z7ZPyCf+HwBvB6xuuktSKaO7kIxidZgbwaF
	bSXZ3qDskE/g==
X-Google-Smtp-Source: AGHT+IH7ZMKSdqmekj5haFzANAciqUU5tKO1zCWwczU/8ZOjMqgAYLGB6etXPY1O7g1rn4Nha+5qqA==
X-Received: by 2002:a05:600c:1c0c:b0:458:bda4:43df with SMTP id 5b1f17b1804b1-45b727a2c43mr16217345e9.17.1756296921471;
        Wed, 27 Aug 2025 05:15:21 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c70eb7eed5sm19747374f8f.18.2025.08.27.05.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:15:21 -0700 (PDT)
Date: Wed, 27 Aug 2025 14:15:18 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7 0/2] Add ADI I3C Controller
Message-ID: <4cnv4s5puov5xrzfvv4fn4ndwup6g5kpbeiwjaybqcvacw7tvj@hfr2cusdxr5m>
References: <20250818-adi-i3c-master-v7-0-f7207902669d@analog.com>
 <aK3ZFSQ9FUwuxT12@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aK3ZFSQ9FUwuxT12@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_051523_255359_904B8731 
X-CRM114-Status: GOOD (  38.68  )
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

On Tue, Aug 26, 2025 at 11:56:05AM -0400, Frank Li wrote:
> On Mon, Aug 18, 2025 at 01:51:12PM +0200, Jorge Marques wrote:
> > I3C Controller is subset of the I3C-basic specification to interface
> > peripherals through I3C and I2C. The controller RTL is FPGA
> > synthesizable and documentation is provided at
> > https://analogdevicesinc.github.io/hdl/library/i3c_controller
> >
> > The main target for the I3C Controller IP is low-cost FPGAs.
> > In this version the driver supports IBI (only the MDB), I3C and I2C
> > transfers.
> >
> > The IP Core is versioned following ADI's open source HDL guidelines
> > for devicetree bindings and drivers described at
> > https://analogdevicesinc.github.io/hdl/user_guide/contributing.html#devicetree-bindings-drivers
> > in summary, follows Semantic Versioning 2.0.0, with the dt-binding suffixed
> > by -v<major>.
> >
> > If necessary, the contents of
> > https://analogdevicesinc.github.io/hdl/user_guide/contributing.html#devicetree-bindings-drivers
> > can be replicated to a file in a different series, similar to AMD Xilinx
> > at Documentation/devicetree/bindings/xilinx.txt, but as adi.txt or
> > similar.
> >
> > Depends on https://lore.kernel.org/linux-i3c/20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com/T/#t
> 
> It is already in v6.17-rc1. You can remove this depends.

Ack

Best regards,
Jorge
> 
> commit 733b439375b494e8a6950ab47d18a4b615b73cb3
> Author: Jorge Marques <jorge.marques@analog.com>
> Date:   Tue Jun 24 11:06:04 2025 +0200
> 
>     i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()
> 
>     The I3C abstraction expects u8 buffers, but some controllers operate with
>     a 32-bit bus width FIFO and cannot flag valid bytes individually. To avoid
>     reading or writing outside the buffer bounds, use 32-bit accesses where
>     possible and apply memcpy for any remaining bytes
> 
>     Signed-off-by: Jorge Marques <jorge.marques@analog.com>
>     Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>     Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>     Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>     Reviewed-by: Frank Li <Frank.Li@nxp.com>
>     Link: https://lore.kernel.org/r/20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com
>     Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 

> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> > Changes in v7:
> > - Edit cover linking guidelines to ADI IP Core versioning.
> > Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml:
> > - Extend second clock description to explain relation to synthesized topology.
> > - Link to v6: https://lore.kernel.org/r/20250717-adi-i3c-master-v6-0-6c687ed71bed@analog.com
> >
> > Changes in v6:
> > - Format 0x05C undercase
> > - Link to v5: https://lore.kernel.org/r/20250715-adi-i3c-master-v5-0-c89434cbaf5e@analog.com
> >
> > Changes in v5:
> > Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml:
> > - Use semantic versioning major field for dt-binding compatible, with
> >   the format adi,<ip-name>-v<major>
> >
> > adi-i3c-master.c:
> > - Rename MAX_DEVS to ADI_MAX_DEVS
> > - Encapsulate REG_CMD_FIFO_0_DEV_ADDR var
> > - Reorder struct adi_i3c_i2c_dev_data fields
> > - Start addr at 0 instead of 8 at adi_i3c_master_get_rr_slot
> > - Minor rework on adi_i3c_master_handle_ibi to most logic out of the
> >   lock. Even if length is 0 (BCR[2]=0), the mdb field is extracted and
> >   written to the slot buffer. Since the length is 0, the written data
> >   doesn't matter.
> >   In a future update with additional bytes support (e.g., bits 31-23),
> >   len would be incremented and an IBI FIFO would be read.
> > - Version check against first stable release, major v1.
> >   Driver+RTL features updates affect the minor field, therefore check
> >   for major == 1.
> > - Link to v4: https://lore.kernel.org/r/20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com
> >
> > Changes in v4:
> > Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml:
> > - Add -1.00.a suffix where missing
> > - Extend clocks descriptions
> > - Add minItems to clock-names, to match clocks
> > - Use header in example
> >
> > adi-i3c-master.c:
> > - Regmap:
> >   - Add new controller info registers (dyn_addr, dcr, bcr, pid)
> >   - Always decreasing fields
> >   - Add line break between registers
> >   - Reformat REG_DEV_CHAR_BSCR_IBI to use easier to read FIELD_GET,
> >     FIELD_PREP
> > - Read controller info from regmap with explanation comment
> > - Use linux/fpga/adi-axi-common.h macros
> > - Use __counter_by macro on ncmds
> > - Use __free macro
> > - Use new i3c_writel_fifo and i3c_readl_fifo macros
> > - Rename bytes to buf when nbytes is present
> > - Use scoped_guard instead of spin_lock, spin_unlock
> > - Reformat loops to read fifo status, use while single line alternative
> > - Drop adi_i3c_master.max_devs, use MAX_DEVS directly
> > - Use devm_clk_bulk_get_all_enabled, dropping clock name match (CHECK_DTB does it)
> > - Init spin_lock
> > - Init list head
> > - Link to v3: https://lore.kernel.org/r/20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com
> >
> > Changes in v3:
> > Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml:
> > - Small reworking of the description
> > - Add -1.00.a suffix to compatible
> >
> > adi-i3c-master.c:
> > - Misspelling
> > - Remove REG_CMD_FIFO_0_LEN_MAX since it is a HDL parameter
> > - Use adapter timeout value for I2C transfers, as in
> >   https://lore.kernel.org/linux-i3c/aEBd%2FFIKADYr%2F631@lizhi-Precision-Tower-5810/T/#t
> >
> > - Link to v2: https://lore.kernel.org/r/20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com
> >
> > Changes in v2:
> > Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml:
> > - Move allof
> > - Rename clocks to axi, i3c
> >
> > adi-i3c-master.c:
> > - Update license year
> > - Rework regmap to use FIELD_GET, FIELD_PREP
> > - Reformat regmap to have FIELDS after REG, prefixed by reg name.
> > - Add overflow safeguards to cmd, tx fifos
> > - Fix macro related macros (mostly erroneous `| ~BITMASK`
> > - Use guard macros, remove goto.
> > - Simplify daa logic
> > - Replace devm_clk_get with devm_clk_get_enabled
> > - Solve 64bit->32bit warnings on x86_64 systems by casting to u32
> > - Immediate clear irq request flags, then handle it.
> >
> > - Link to v1: https://lore.kernel.org/r/20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com
> >
> > ---
> > Jorge Marques (2):
> >       dt-bindings: i3c: Add adi-i3c-master
> >       i3c: master: Add driver for Analog Devices I3C Controller IP
> >
> >  .../devicetree/bindings/i3c/adi,i3c-master.yaml    |   72 ++
> >  MAINTAINERS                                        |    6 +
> >  drivers/i3c/master/Kconfig                         |   11 +
> >  drivers/i3c/master/Makefile                        |    1 +
> >  drivers/i3c/master/adi-i3c-master.c                | 1019 ++++++++++++++++++++
> >  5 files changed, 1109 insertions(+)
> > ---
> > base-commit: 51963783b876a2f493a3eac0ea9eba271cb6809a
> > change-id: 20250604-adi-i3c-master-2a5148c58c47
> > prerequisite-message-id: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
> > prerequisite-patch-id: 5443f14ca82fc08593960fafdb43488cce56f7d9
> > prerequisite-patch-id: 647084f5fe09f4887f633b0b02b306912a156672
> > prerequisite-patch-id: 6f582bb2ef1aafb66f26c515a19d5efa06ab8968
> >
> > Best regards,
> > --
> > Jorge Marques <jorge.marques@analog.com>
> >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
