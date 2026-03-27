Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D5D10BA439
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Mar 2026 08:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmIV5JdDGVUtQ/EWEvNoleIz+tvq+qBLG29d7MRRtzM=; b=xeeqccNJDpS5aP
	XBHsb247JeBw+LpkXKk4ElC3EzF6wdDKJA5+QjrM7BVkZ60v2BvJtMDiMmwKGFUvCXUj3JUXl5lEk
	4EN84cReAz8FLxUXvkluCqLmxHiJmbs5J5I/mzJFjfRG0WMYlEXzUrVCpcPOUENpjWMGXLZPQM9OB
	N2CWuz+kpXCJWkDojUHNEiq/JeWMWVBdEfaVx+x3OUWYZb0cScyn3LRODmHo6JFzXmy5r51DISNsm
	J7SD5TuG0jffo75QGEeKWfIn5VZMByTtT6xr27+Jn4jaqpJvidVmQF5O+e/kILzR3hRZhxw0MS4ik
	8EKTLS5NS8gjSKbt3YwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62Pb-00000006xFF-2E3U;
	Fri, 27 Mar 2026 08:19:23 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62PZ-00000006xEu-1N0J
	for linux-i3c@lists.infradead.org;
	Fri, 27 Mar 2026 08:19:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9oPI4XIwxE9pKkNX8X2t98niZ+JMwV71tQKnpIR8Fe0+gKRZF30oW0APtnHCY7llIT8CeRSgGhcecAliKrfrfOthBA5OP6eBorG8XsI5e6UN3NZHYokAXawgeY0xMagT4NYNzZUjjEykqnp7vl2MrM6rbxN3HHv/9KT8UZtmTzf97Zhw/27rAsTbR1giPrUu8OklgQeMyQwNi3ZRaOmG9CU9NAdl6yLTgwbN//QdTq/jx5sGOnLUBBsAT3cctg3yl3deUhVJh4u4oB8Y1NW3q0AAmWMRY8tmzLFKG7Kirhb5Z7PMAqVy0B+9E6doZsw4pK+Sf37tVjFVA3hWaswwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68mxN0pzEoxfmY3HzCY0Cs5J5KLcyyJGwm3DdEL19O4=;
 b=w/wq1PF4FvB6U8skOmyndtRgNCAD95h42kGIZyrx/Z3xGOT7HvH4whDgu2GafHDQ/qIk09s3JGDbySS5F0ayzwtG+lq8IUib2RdPjR81qAyuk36tzcsmR1giWxWF6bRewaTHVbt77hwIxw89ehtt3zxsD4NEpkHJLl8C20lgiPhMpiFuV4cXVUgxNJD9BXYRJBr3tBRefYF9LyCwsfR2dPj/JMcEYdnWm830YQK1IJFbuQVmH/7nUsuLJ5xuXvVcfSNB7VHsgw3lmdsff7n8Nbhi9PoIBdgUWxYddLdlClS7LJEsE2M/G6uEDfbHSvdRumHrOWU6taH9en0N69018w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68mxN0pzEoxfmY3HzCY0Cs5J5KLcyyJGwm3DdEL19O4=;
 b=RORh+QWfqj8FLnogBTbuZWEOUqc63qPHALR5Z2n2VQh2/xsY7Avz9MQSxOWWLkoxIn+SuKR+yAdOPPP734WlcmYod9ARyFGGFQqH0q3I1KZC6ZtjSNZE6CEA+3T7VbnKc8bz5m03+vua7UrSgvobUuxFtKeqmSGCdUvITBaZNf14AlmPnNX1sn09tge953XMSD5pKh2kAJXbwtWKzEVY5JfubmcO14eMh/e0J5qMWWZPjuIoqwcZK+jccqY7AAvFbMDzRX6Px8szvhtH0mkcOwZkH4asoRbhdZQRu5f/gh/+vBrTcynPoAsm8leql6d+x8zdHynCrk1ODExO8pSmcg==
Received: from MN0PR02CA0017.namprd02.prod.outlook.com (2603:10b6:208:530::35)
 by PH8PR12MB7350.namprd12.prod.outlook.com (2603:10b6:510:216::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 27 Mar
 2026 08:19:09 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:208:530:cafe::82) by MN0PR02CA0017.outlook.office365.com
 (2603:10b6:208:530::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 08:19:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 08:19:08 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Mar
 2026 01:19:06 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 27 Mar 2026 01:19:05 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 27 Mar 2026 01:18:59 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <conor+dt@kernel.org>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>,
	<rafael@kernel.org>, <robert.moore@intel.com>, <robh@kernel.org>,
	<smangipudi@nvidia.com>, <thierry.reding@kernel.org>
Subject: Re: [PATCH 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
Date: Fri, 27 Mar 2026 13:48:58 +0530
Message-ID: <20260327081858.32354-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <202603261544313f63018c@mail.local>
References: <202603261544313f63018c@mail.local>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|PH8PR12MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 8229ad51-0c32-4306-caae-08de8bd98526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|36860700016|376014|1800799024|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dKg442p9Fk/SUbT6Xu8QLGWk/gwmutOzDrWVskSNU1KB+E3JmfwqW9LCoC7+mXlr0tFugVcffgb8iDHuk+QWRYK2e+SbMzgck3VgwjcRxSaV6x+4lRrGw6uRpy3sd/jzYoarjbJYUFIub4300hxlfRXeaiXAQ196Onbhbawex5upAHQ8y6m0YlAOnIhjzLW3U5tSyNSnkwYGGUlb5eT1ZvwFleVLfXOiCUprLxab11FKN/7w61L6X4Uv5N+5E07Mndwux8hGBudmcdYBmuW2GD9W0FArIVNARlPWB/0Q66IFOchlvy8LizyvTlhBEtWK1oiGa34a4dAxtrDSBOTCfHTPw8I705CgE0Vnxz0dVSHg8xb254gKOQR9VFH2ySAeIsXG8zKE4APIJ/CruWGazNbqUbRTnnACz0IXcBVLYKYatszfHAji5Fg+6xBR6r0Ln4EyFjz6wTE3lbkl+fJRWjiMewZs5SFrm86EoIRUdgsP528qCUJ0bMx9h8CO9/VlgzIeDFTxxlhSeW0aEiwbghsBwWqQC9i2jZuO/CU/Gq3uaS2S/nXBCKkWSzi8iEssl3DSAfv9Wl+fUSy0E/V6EYVmTRxNplGhFq9kPgvOjDMilb9oQx9XWUv2rYP93qB+nR7wsm6sJGlCUla94T1kIukWpbkuC/Q0KZKZsjQ69UXjOpKQRkBnO5A7QxfRYggCd5PF+4B3fqmXw9d/fyR57s/ghICrPc6gI/fyOoUDPNO5AoRrCvSLtJMp62iDPxQO9pgD6ufjvNF6zbMum0iKBQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700016)(376014)(1800799024)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bXAl3MWJIigbGmPT6cX6tNcCOCY7xfbeGpMaF+WKfwoveuAUZVdP+Cow11POQFzE/PmBuODB4lSC4lEPQ9Av6EI2Ke3kZOSVwRsCF5WskSyWhbJIIBqwWJZvSRNDqjVorUPw8sO1qxz35dabGx8/QYjRrQTO5Fo0NVkHZC+IE4anpMea8+EbcFuUoJ9ZMCW/MztWa+UcWuwbgpYXsxcVbCm7VJY94S+atUKSGP2dalK8QK3J9YSXxaNoGVN72kF705H8BF8qFccwgDXECAtGFpTCw1SBiRGsyFnqh7nczc+HxK4e6I3DuIf8OITlhXWHRzoVwnZScxI+mGICsBsiRgy0JMQy1oew+yLDLCW+AigxLCcKjwxCXLedILCBCjCuIKthpDxzc2+w/qdI5kozAjqyIQ8IcvrvMa5E/FLkw+vbhoANFWk/z0zFnnAWu3J8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 08:19:08.9409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8229ad51-0c32-4306-caae-08de8bd98526
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_011921_375064_6713BEE0 
X-CRM114-Status: GOOD (  33.77  )
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

On Thu, 26 Mar 2026 16:44:31 +0100, Alexandre Belloni wrote:
> On 26/03/2026 10:05:03-0500, Rob Herring wrote:
>> On Wed, Mar 18, 2026 at 05:31:50PM +0000, Conor Dooley wrote:
>> > On Wed, Mar 18, 2026 at 10:57:14PM +0530, Akhil R wrote:
>> > > Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
>> > > Discovery and Configuration Specification [1] to specify which discovery
>> > > method an I3C device supports during bus initialization. The property is
>> > > a bitmap, where a bit value of 1 indicates support for that method, and 0
>> > > indicates lack of support.
>> > > Bit 0: SETDASA CCC (Direct)
>> > > Bit 1: SETAASA CCC (Broadcast)
>> > > Bit 2: Other CCC (vendor / standards extension)
>> > > All other bits are reserved.
>> > > 
>> > > It is specifically needed when an I3C device requires SETAASA for the
>> > > address assignment. SETDASA will be supported by default if this property
>> > > is absent - which means for now the property just serves as a flag to
>> > > enable SETAASA, but keep the property as a bitmap to align with the
>> > > specifications.
>> > > 
>> > > [1] https://www.mipi.org/specifications/disco
>> > > 
>> > > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> > > ---
>> > >  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
>> > >  1 file changed, 26 insertions(+), 4 deletions(-)
>> > > 
>> > > diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
>> > > index e25fa72fd785..1705d90d4d79 100644
>> > > --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
>> > > +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
>> > > @@ -31,10 +31,12 @@ properties:
>> > >        described in the device tree, which in turn means we have to describe
>> > >        I3C devices.
>> > >  
>> > > -      Another use case for describing an I3C device in the device tree is when
>> > > -      this I3C device has a static I2C address and we want to assign it a
>> > > -      specific I3C dynamic address before the DAA takes place (so that other
>> > > -      devices on the bus can't take this dynamic address).
>> > > +      Other use-cases for describing an I3C device in the device tree are:
>> > > +      - When the I3C device has a static I2C address and we want to assign
>> > > +        it a specific I3C dynamic address before the DAA takes place (so
>> > > +        that other devices on the bus can't take this dynamic address).
>> > > +      - When the I3C device requires SETAASA for its discovery and uses a
>> > > +        pre-defined static address.
>> > >  
>> > >    "#size-cells":
>> > >      const: 0
>> > > @@ -147,6 +149,26 @@ patternProperties:
>> > >            through SETDASA. If static address is not present, this address is assigned
>> > >            through SETNEWDA after assigning a temporary address via ENTDAA.
>> > >  
>> > > +      mipi-i3c-static-method:
>> > > +        $ref: /schemas/types.yaml#/definitions/uint32
>> > > +        minimum: 0x1
>> > > +        maximum: 0xff
>> > > +        default: 1
>> > > +        description: |
>> > > +          Bitmap describing which methods of Dynamic Address Assignment from a
>> > > +          static address are supported by this I3C Target. A bit value of 1
>> > > +          indicates support for that method, and 0 indicates lack of support.
>> > 
>> > I really am not keen on properties that are bitmaps, why can't we just
>> > use the strings "setdasa", "setaasa" etc?
>> 
>> If this comes from a specification, then I'd tend to just copy it rather 
>> than invent our own thing. Obviously if is something structured 
>> fundamentally different from how DT is designed, then we wouldn't. But 
>> this is just a simple property.
>> 
> 
> The issue being that the specification is not public so it is difficult
> to take any decision.

There is a public version available in the same link, but you would still
have to provide them a name and an email ID. The document will be sent to
the mail ID.

Regards,
Akhil

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
