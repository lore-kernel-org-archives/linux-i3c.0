Return-Path: <SRS0=AS6i=GS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B625C433DB
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Jan 2021 17:03:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D47DF2313E
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Jan 2021 17:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D47DF2313E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QM8KpoPacidI0RZJKZlGqT9rVdSBVkfg060Na5gKxOk=; b=iPsL0NC9+4Dg92E2qtCSYlwkJ
	uGVke9TVVwddRU3HbW/oGSkVzwa/QIYZYWLfbYcxVCsukJ9tPC8TbXPzW3Wkj54Jy2ylFrbQWbzc8
	q2Y03s4qsRnuw7h409pxGSx2ooa1mHOmDgEs2etoIf6a49Nch4ZtcwqoFOP3MMyHprkcv31uK3H23
	NyP/Qg12Ow9g/N6zjwauP/7Zm2dAL+lHhze10G6HCpAOf2ziUhb99CrNCkp/rz3hwFMrRd9xlhvKn
	DeB5I5b7J6KMJCYd3PKzw/S6q3wgJDDzn/NCt+Sjy926s4uiqnvtfHvxpMAg1ecWPDXTlwHQ5Vow+
	hdfC7idbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0SVL-0007MO-0o; Fri, 15 Jan 2021 17:03:19 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0SVH-0007Lb-48
 for linux-i3c@lists.infradead.org; Fri, 15 Jan 2021 17:03:16 +0000
Received: by mail-oi1-f178.google.com with SMTP id d203so10246670oia.0
 for <linux-i3c@lists.infradead.org>; Fri, 15 Jan 2021 09:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/OvelA4HeGR92iEEaPNHBi4zmvVQKPG5Hwe6GfJRKLY=;
 b=BYd8vcx1fY3JindBe3gh+y9VK53EJZwJ5e+FwiFW6RXa0NxNWX3u2uOcLiD6a/1GVU
 uk420gCHOpani0nSjivZHI1NcaSTijtyD/nOy165K5R0DDKNMfD5W1EV5JUnv0SzmfW7
 Qcyf0znDCmP83OsZKzzoKsafTu4CKEIu5SWk5KgdWX7O9/5NGsvQW9inZJeA8lW66Ojw
 MJ8S5TSbFmexpz55ItK5LejiI2pf5zTqxp2xsFQHsDHBaXGIhhbZgohX4Wve4TinZ0Jk
 NHak2oIBOoJHNkdVFNRajjkWYtnTVRr5m3iUBjXIgaSpXU71Ff/FzleLvZNsOCLXBzLK
 Kjog==
X-Gm-Message-State: AOAM532/tG3ZvHVpj1SrEe35MJwsqYnIbJEXplJJPGpSlEOWgffWlVwn
 mzU4gBHvJTcRRBWqD03FsA==
X-Google-Smtp-Source: ABdhPJwvet5B0vgZZQ/r7DPNDSeopDo2dxg5o+oNmXNwVEIlwFaUE7woNe5Mq6uIRtyAbkrRs3Daog==
X-Received: by 2002:aca:5f07:: with SMTP id t7mr5979293oib.39.1610730193796;
 Fri, 15 Jan 2021 09:03:13 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y10sm1944234ota.42.2021.01.15.09.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 09:03:12 -0800 (PST)
Received: (nullmailer pid 1453209 invoked by uid 1000);
 Fri, 15 Jan 2021 17:03:12 -0000
Date: Fri, 15 Jan 2021 11:03:12 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: i3c: Convert controller description
 to yaml
Message-ID: <20210115170312.GA1434283@robh.at.kernel.org>
References: <20210114175558.17097-1-miquel.raynal@bootlin.com>
 <20210114175558.17097-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210114175558.17097-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_120315_262664_0F91A119 
X-CRM114-Status: GOOD (  31.02  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-i3c@lists.infradead.org,
 Conor Culhane <conor.culhane@silvaco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, Jan 14, 2021 at 06:55:53PM +0100, Miquel Raynal wrote:
> Attempting a conversion of the i3c.txt file to yaml schema with
> minimal content changes.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/i3c/i3c.txt | 140 -------------
>  .../devicetree/bindings/i3c/i3c.yaml          | 186 ++++++++++++++++++
>  2 files changed, 186 insertions(+), 140 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i3c/i3c.txt
>  create mode 100644 Documentation/devicetree/bindings/i3c/i3c.yaml


> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> new file mode 100644
> index 000000000000..79df533ab094
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> @@ -0,0 +1,186 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I3C bus binding
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +description: |
> +  I3C busses can be described with a node for the primary I3C controller device
> +  and a set of child nodes for each I2C or I3C slave on the bus. Each of them
> +  may, during the life of the bus, request mastership.
> +
> +properties:
> +  $nodename:
> +    pattern: "^i3c-master(@.*|-[0-9a-f])*$"
> +
> +  "#address-cells":
> +    const: 3
> +    description: |
> +      Each I2C device connected to the bus should be described in a subnode.
> +
> +      All I3C devices are supposed to support DAA (Dynamic Address Assignment),
> +      and are thus discoverable. So, by default, I3C devices do not have to be
> +      described in the device tree. This being said, one might want to attach
> +      extra resources to these devices, and those resources may have to be
> +      described in the device tree, which in turn means we have to describe
> +      I3C devices.
> +
> +      Another use case for describing an I3C device in the device tree is when
> +      this I3C device has a static I2C address and we want to assign it a
> +      specific I3C dynamic address before the DAA takes place (so that other
> +      devices on the bus can't take this dynamic address).
> +
> +  "#size-cells":
> +    const: 0
> +
> +  i3c-scl-hz:
> +    $ref: /schemas/types.yaml#/definitions/uint32

With a unit suffix, you don't need the type.

> +    description: |
> +      Frequency of the SCL signal used for I3C transfers. When undefined, the
> +      default value should be 12.5MHz.
> +
> +      May not be supported by all controllers.
> +
> +  i2c-scl-hz:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Frequency of the SCL signal used for I2C transfers. When undefined, the
> +      default should be to look at LVR (Legacy Virtual Register) values of
> +      I2C devices described in the device tree to determine the maximum I2C
> +      frequency.
> +
> +      May not be supported by all controllers.
> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":

You can drop '^.*':

"@[0-9a-f]+$"

> +    type: object
> +    description: |
> +      I2C child, should be named: <device-type>@<i2c-address>
> +
> +      All properties described in Documentation/devicetree/bindings/i2c/i2c.txt
> +      are valid here, except the reg property whose content is changed.
> +
> +    properties:
> +      compatible:
> +        description:
> +          Compatible of the I2C device.
> +
> +      reg:
> +        items:
> +          - description: |
> +              1st cell
> +              ========
> +
> +              I2C address. 10 bit addressing is not supported. Devices with
> +              10-bit address can't be properly passed through DEFSLVS command.
> +
> +              2nd cell
> +              ========
> +
> +              Should be 0.
> +
> +              3rd cell
> +              ========
> +
> +              Shall encode the I3C LVR (Legacy Virtual Register):
> +              bit[31:8]: unused/ignored
> +              bit[7:5]: I2C device index. Possible values:
> +                * 0: I2C device has a 50 ns spike filter
> +                * 1: I2C device does not have a 50 ns spike filter but supports
> +                     high frequency on SCL
> +                * 2: I2C device does not have a 50 ns spike filter and is not
> +                     tolerant to high frequencies
> +                * 3-7: reserved
> +              bit[4]: tell whether the device operates in FM (Fast Mode) or
> +                      FM+ mode:
> +                * 0: FM+ mode
> +                * 1: FM mode
> +              bit[3:0]: device type
> +                * 0-15: reserved

We can do a bit better:

reg:
  items:
    - items:  # Note: drop the '-' if we support more than 1 entry
        - description: I2C address...
          maximum: 0x7f  # Not sure this works, do we support the high 
                         # flag bits here?
        - const: 0
        - description: I3C LVR (Legacy Virtual Register)...

> +
> +    required:
> +      - compatible
> +      - reg
> +
> +  "^.*@[0-9a-f]+,[0-9a-f]+$":
> +    type: object
> +    description: |
> +      I3C child, should be named: <device-type>@<static-i2c-address>,<i3c-pid>
> +
> +    properties:
> +      reg:
> +        items:
> +          - description: |
> +              1st cell
> +              ========
> +
> +              Encodes the static I2C address. Should be 0 if the device does not
> +              have one (0 is not a valid I2C address).
> +
> +              2nd and 3rd cells
> +              =================
> +
> +              ProvisionalID (following the PID definition provided by the I3C
> +              specification).
> +
> +              Cell 2 contains the manufacturer ID left-shifted by 1. Cell 3
> +              contains the ORing of the part ID left-shifted by 16, the instance
> +              ID left-shifted by 12 and extra information.

Similar rework here.

> +
> +      assigned-address:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0x01
> +        maximum: 0xFF
> +        description: |
> +          Dynamic address to be assigned to this device. This property is only
> +          valid if the I3C device has a static address (first cell of the reg
> +          property != 0).
> +
> +    required:
> +      - reg
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    i3c-master@d040000 {
> +        compatible = "cdns,i3c-master";
> +        clocks = <&coreclock>, <&i3csysclock>;
> +        clock-names = "pclk", "sysclk";
> +        interrupts = <3 0>;
> +        reg = <0x0d040000 0x1000>;
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +        i2c-scl-hz = <100000>;
> +
> +        /* I2C device. */
> +        nunchuk: nunchuk@52 {
> +            compatible = "nintendo,nunchuk";
> +            reg = <0x52 0x0 0x10>;
> +        };
> +
> +        /* I3C device with a static I2C address. */
> +        thermal_sensor: sensor@68,39200144004 {
> +            reg = <0x68 0x392 0x144004>;
> +            assigned-address = <0xa>;
> +        };
> +
> +        /*
> +         * I3C device without a static I2C address but requiring
> +         * resources described in the DT.
> +         */
> +        sensor@0,39200154004 {
> +            reg = <0x0 0x392 0x154004>;
> +            clocks = <&clock_provider 0>;
> +        };
> +    };
> -- 
> 2.20.1
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
