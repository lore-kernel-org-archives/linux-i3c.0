Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D1FD1D478
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 15:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8GZOcoMNW5Jmj+RLVjt7i/CtmvksGfAHw2lXya9BSj4=; b=VWgIIKypfsbIuz
	msAXWUtynEPDMKOJAmjf9ZpRvGjSZ7vzfEK3vnUxe9jIIzdVG6IWfgaGYWVTihsAKUC0zvq9pXFF2
	aXu0Mtb6wTgWnehvjfLG+xSpaTzw2qHobnpO8QcpuHRU1s7MBkVR1Gz/WZuIaABilYcTvOqYBpfU/
	b28USKVfroUKSJ38vMJobWobQsi8hjXdhqzxR+ghVUi7iZreEOavpjM9KXa30RoCWF4VZie/Xr2wO
	JC9bQXi7Te4EpBGrRudhdeg1MUbiTLNVHP/iVGC2ob2ypn+U12PqwAuksgz2dH5Y9Ip2+9YSNsqZm
	hKPjMAuH9RDTlVTX2V7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrwd-0000000HWm4-3YAp;
	Thu, 08 Jan 2026 15:29:03 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrwb-0000000HWlB-0ZXr
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 15:29:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ku9Eg2iJrtgyvad/U4ghnoxDa+ELgtkYfkkVldHOu5z1pJkL63/LmZQDsCN1StnfXCZTeJw4OAcn1xX3XNfVhzPx4BHAt8UPK0vlFIJIHK8R79nQ8PZuh7zx49e9xBgou94o7VBnutVJS8mO9g4OwT7Qkd+HPejRQokjLPW9wY8KD27637x+yXntsbkTpur7pOj7eqw+9rYJ2m7nZ/5x7AINt7ZdKQGiKgY7IGkdkt1pM2Qe91oaKghqGVxn8f/0+BQ0nOmyuMId+lmZoCCJyMccCYR/xfJ8pcMx3IEGBlU6bTiiDCp6lSrlDU/aKKRLAa9E+fIZM+m7c82It+4lzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2TUxS5c1uv6ZgdSUV44Aiev+3PCcdWjAxM9gkWlUcQ=;
 b=pPpS/txUnNcD2fwXp8rgKFcPsp++qrMyH3cnc6uccsvTyTmNC63QGRGmGS559Mleh8KyCv4zqo+52egrwP7aEh2V8iosBbuNSD/BkmDCpkCxDI5W0cC17vyBjzMORTC33JHln+ttbZ7pUtqwaekxinEfTj6wesl4hUuZZQBICvnY61vl7Er6V6OM7t9Ao92YEuQIhsqX6lG3WSw+egsph/PyEu4vInTeg+/wwqjeUZma6QaeV2c+CZdkV2suY0j2m0hQt9bBiz12HjTn9bso2X+LptnIZ9sYRODFhmVZ0OQCm9ejWncwYBkyVty67PIZsjtA64iDI3s1a7GBzQUYsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2TUxS5c1uv6ZgdSUV44Aiev+3PCcdWjAxM9gkWlUcQ=;
 b=PQL9lu5vZD4ABkcweRgbPxXgHvHZJe/58/THXN+P/rOJrpBcji9T1LeMZjnQ5elTtHDlhBqosVAfz6LwFKMb+q06sL+oALx2gqhw+ffFWbfVR25IjKp7864bzxSD59fl7F+fesNpg0DVS0LiCRVSQLl2/jdLEFt4BszNTiJg/gzK50VgnhakcvBfpzBKO7/g1DkkSg/zuMWP3DGTLJINGrnRICHvwSI9tY5N7b6EI4Qaq9boTuXWbMahJ+QsnTZIuDnYQvso8I87Dk9IkWhsP6p+STNscBMOi9oV5DT3zRysn2+5ULjAEbsBj3UiIjbfOfb8MFGZ11sBGUBSF6oKJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DUZPR04MB9948.eurprd04.prod.outlook.com (2603:10a6:10:4dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 15:28:57 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 15:28:57 +0000
Date: Thu, 8 Jan 2026 10:28:50 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 17/20] i3c: mipi-i3c-hci: Factor out master dynamic
 address setting into helper
Message-ID: <aV/NMmafNj4LkiqR@lizhi-Precision-Tower-5810>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
 <20260108080558.21767-18-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260108080558.21767-18-adrian.hunter@intel.com>
X-ClientProxiedBy: BYAPR07CA0042.namprd07.prod.outlook.com
 (2603:10b6:a03:60::19) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DUZPR04MB9948:EE_
X-MS-Office365-Filtering-Correlation-Id: 600709f2-677e-43cc-a379-08de4ecaa402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1DD0RceLB9cHRSHAxpKsR2RIVPrzE/qTxgtX3Sm5Xz0UXlCsl+Xpde8tcjfA?=
 =?us-ascii?Q?jtnzG+V1Jma+TviVEWPUSKf/HyhH2lLZ+zReXmJMpYVWZNXYQ5TH5OR9eTaY?=
 =?us-ascii?Q?ISPU3Vq6E4WWZe5X5cGkVj6w/1yJZ1RMW55UF4fulNIjnd2Wgb3omb2RW2Sr?=
 =?us-ascii?Q?rqg/FJiDjEkuq6quG2Axlzan1jhCNEZCYhhEkwZt7ZfLZ57tkrLjbVkSY+Io?=
 =?us-ascii?Q?q5NJRvqlqSY7qVohwqCw/kMaUlX11upUbIhcbz/xXjIt/ZxNw3e8INqMXhMv?=
 =?us-ascii?Q?LXdpYLzJDM+sW6mt7anjA7LaxIXztlqoJJoNkbBJda9FS9/8LC3akAD0sOA1?=
 =?us-ascii?Q?YOB9haRBKoOkNK9TnaHUpxyUIgpmtdsRtt1YQFg/w/O6DSyv3TO7/U9BaMKw?=
 =?us-ascii?Q?XnLi+1Nerwjk5dKr3FGnSE4h5mGFH765GxkBk77QoG3SdUUn7yl9ajvgGdXJ?=
 =?us-ascii?Q?Xuzax6tPIraA7h0xmydmiGNDxXeqM6PvGfJr2NDDmFoUi9WUkcusmCLlDpOm?=
 =?us-ascii?Q?iCBSg1YL+kpciunaIWKgPLOM9szVTenBCMbASxIqJWimIIUbhnUWhf9P4x58?=
 =?us-ascii?Q?PSeShWibTmDYNf/XHCy3GsamXqkRyWn4Nm4D9JjIaSunpxMZlK3NtS+lFLSj?=
 =?us-ascii?Q?npg8+zugGnNQhl3L++aKehPeyqKOQOv4qe+19KX4aEesAbHUxbSfy0GjyKkV?=
 =?us-ascii?Q?sp2VO0uLOnI8YPwMhBiOViivI62+jw2hBQkZtP+gV/kBpTV7gZPDFXhJ4y2E?=
 =?us-ascii?Q?t/ZVeuz7N3gMruMTowoIxNfXW7C9itJ9pd9B/Xh9090QCsZh8y50gI5p1nx5?=
 =?us-ascii?Q?1i/HppkuBX7UzHGLQ9WWgeK2KeSR3nUjLlcZ9t2VT/Q8V+wjPOK2UiFqNXeO?=
 =?us-ascii?Q?VHPISbr7UFjH31b8fAVO2YhmoDlml9P/3E/P/hJcbEmtWosLBbscS9OtdM7G?=
 =?us-ascii?Q?m+nTmgmZUiRgJK30VEi17MYlzSpM40fZ68EA9x54+Xmy1g3V1ETass7H+Tvz?=
 =?us-ascii?Q?UT8o8crhzMHzWIqDc2VkEKcnDhK5kJmQNX1LQLIsRYc/i0Pb3dSO/6g40vVV?=
 =?us-ascii?Q?ErahWT0kGNkegT5aYF0i6GFBdkhp7+ALSut0UXB5P91/Fs26hZ88OoCZAOiO?=
 =?us-ascii?Q?pRrJvZTRsm9gFuSE5eoKQCXZrH+X5HNvmFZzKj/6gXyP//022ptJH8ZXkDr8?=
 =?us-ascii?Q?deZZeote3/CP+96cxH6+lWbB1ks1+22mbXbqGTZW1r4+ZpgtZOg1fL1UgwaF?=
 =?us-ascii?Q?AJTg3YNuSaXimVZzKdvjvMOkDe7E5c+wxElNxT904OGcMrq3JJrS52NRWv34?=
 =?us-ascii?Q?yoxEAqbue3lfc21hEO6ruogLzX3qtdyt2NH6dC65Ejymxpep3aRu4uB6XfrY?=
 =?us-ascii?Q?TTxzf3U/dK/1WppJgHs7pnPNRX6pEK0zCBguE3sl5xpZPwIv+efcSywrz4wm?=
 =?us-ascii?Q?+cUEOLuBgZcgDw17e2wMsHbSc2J1kERTTZ6FkBuA455heSruC+TYoJvJyC0B?=
 =?us-ascii?Q?tzHUW3kzieOW1ahR0RdGgJNs+Mlsqsra92Ls?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Woem8BkQLASBtUTWl/z5dnclSHZyK0wd358KBZgQ9lD8VcgDHKUAoCmnEcDI?=
 =?us-ascii?Q?jgkbPicTHTg5S+iz2PbQVckSp33cGTnIQ6yOdUXfzMwAk1QAGkKNsnr5tywQ?=
 =?us-ascii?Q?bph2+LcPEx6IvD9bNYkFlXPMtwqRDVtHaBAzlSmgihG0dMbZt1fpFuHTUZqU?=
 =?us-ascii?Q?2UfoIIO4b28FPOT2doiOGBATearkkOngMbIKRZ8R4/0L0wcCy23vosqllIed?=
 =?us-ascii?Q?mhKi0e9mJNFMiJAb6eRDE7h7XS+cYSwypjctIEd8HVfoQMeYStciJFMhCnNQ?=
 =?us-ascii?Q?nXtnfhmYnpWgmcQZzBz9nxEsK8YKyYFTXvGVGe/H3Up17Y5aPS9d08rxDmla?=
 =?us-ascii?Q?F2t5rvltygzK18xbBpBysSu9uqgsBkWmsCDS83okIE6dLyBlO6kYN+AhqwNt?=
 =?us-ascii?Q?fRTHeLZH2FwSVZDiDa4fAdPjl++m4bU6mRODo7Y05zwrHIz/9WEa0TVgfcNk?=
 =?us-ascii?Q?QI53aMr9AUZa67B2Q6n36rB8FLXcUj++ud73xrVPIiFRmq21ufK/aSjic4X/?=
 =?us-ascii?Q?4j1vboZzE7+Wz5+ep4PU2TStBU5DkslBah7caq1ai917LwrWIbMxg0Qy9UXM?=
 =?us-ascii?Q?RXu9lnhrf0jjzDwvuLzZh1uzZ0udjIIc7ceKB/FObT922G/b8vv+6BxS+v6p?=
 =?us-ascii?Q?/JWGioTCoGk/+N7gpyV8YbhSSZXhJToEd3gnDFgpz2tvcBrem7E9BP99Xk4l?=
 =?us-ascii?Q?gx76jJ01rlYpY+ed91k5zCFH25ucJr+TviqpaWAe4LeOhK2i/JAP5SYhd7fQ?=
 =?us-ascii?Q?d0PwwolpCleBOk5zwLVh7yb9b1mCEnFVIwiePcOu//msbJemvFK1wNua7SuB?=
 =?us-ascii?Q?gyHnFJ9XYPuCUTx8qeG2eQzJsZZQDm9n2aZ2UJJ21ANnhKvEXDb72h5M5txO?=
 =?us-ascii?Q?mzrVxeoYS+Zs1rt/nAH76sZLPOn470UL8RPKM4Ji28FdckQdXca8CQ2iYJzg?=
 =?us-ascii?Q?ISCuS8GqJbmgDBxbIL5Lv11+nsY2klyWVckT9ac6WQZ1zhRB7g2+tbnKf6bu?=
 =?us-ascii?Q?NSQkaszHgOOaBQrWtJGqZQt61SS+oFHcNDUO+7z/98FZnEFQTjsQMXQTaAt2?=
 =?us-ascii?Q?pt4+ag9JADbncqhwkT5OztZS1EINdusIlElGq+zyoF/rZ6WAcWDcLDBV1KkS?=
 =?us-ascii?Q?F5wkpnqO2iFncsQfxg9vTKw2K+kXlbiMPUoH3Qw/s0p1e271Dxm3eg9Yvu42?=
 =?us-ascii?Q?2Orowco7r6z3FXiMolQRGMxpo+WfBGM1BmF1XmsFfjdNYBB1Kthn6QmoXYvd?=
 =?us-ascii?Q?JfmAFHiXoMtI/6L5lLDHcrYIVGeZQ660ChpNGECRAdGtFHOESoQf8joyR19/?=
 =?us-ascii?Q?2b3DjCTKxfVimen5iy1ot0ELk0vehIIkxsF+JN7GqjGkcXUlTTZ1hdmywH+4?=
 =?us-ascii?Q?MRcZxE7Y0Kmz+h2LTWBoPw4VWMOXmey5L+Kh81MQ6SzcUEWPOEveBXCLWMwM?=
 =?us-ascii?Q?Jy31UhF4b0qCUciVmhG+gel2yF2LMu1YDNRj0wWxZAJd4vloQ6XjiXpw5Hmd?=
 =?us-ascii?Q?pSv+3151V6xczGaK5ZFSCCouCAOJDvVDXF4GwW23RfEIWBAYQCqDBLA2FKdV?=
 =?us-ascii?Q?YsCpeFbCb8HkxNjVMHt1146jHJwdatdvWrSvMd9BieRi/6yB8hyFm+4ab5GA?=
 =?us-ascii?Q?t9cethI1ZVeJwQqReNaUb7atgdQ3EjUN6c/BFnC0MnUHn+2DsRIUmNS9f2uk?=
 =?us-ascii?Q?tzxQm2L0NJOVP5HJacMql8Lkr67xnQTcsW5f2BcctvtWVQ3q8IX4xk/fofwJ?=
 =?us-ascii?Q?afvPa5kchw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600709f2-677e-43cc-a379-08de4ecaa402
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 15:28:57.6334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8QUf10bPPFaZ8IVyt/NVl8S52bPcS8rfxHfoJhzviBBi/liQDMeDGRDTZ96K+YiMxZLZWcizDChwKJQd0Lu/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9948
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_072901_199953_2B3D1659 
X-CRM114-Status: GOOD (  19.45  )
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

On Thu, Jan 08, 2026 at 10:05:55AM +0200, Adrian Hunter wrote:
> Prepare for future reuse.  Move master dynamic address setting logic from
> i3c_hci_bus_init() into a dedicated helper function,
> i3c_hci_set_master_dyn_addr().
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2:
>
> 	New patch
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 12 +++++++++---
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index fc0a47a36961..ec5425f07635 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -114,6 +114,12 @@ static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
>  	return container_of(m, struct i3c_hci, master);
>  }
>
> +static void i3c_hci_set_master_dyn_addr(struct i3c_hci *hci)
> +{
> +	reg_write(MASTER_DEVICE_ADDR,
> +		  MASTER_DYNAMIC_ADDR(hci->dyn_addr) | MASTER_DYNAMIC_ADDR_VALID);
> +}
> +
>  static int i3c_hci_bus_init(struct i3c_master_controller *m)
>  {
>  	struct i3c_hci *hci = to_i3c_hci(m);
> @@ -129,10 +135,10 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
>  	ret = i3c_master_get_free_addr(m, 0);
>  	if (ret < 0)
>  		return ret;
> -	reg_write(MASTER_DEVICE_ADDR,
> -		  MASTER_DYNAMIC_ADDR(ret) | MASTER_DYNAMIC_ADDR_VALID);
> +	hci->dyn_addr = ret;
> +	i3c_hci_set_master_dyn_addr(hci);
>  	memset(&info, 0, sizeof(info));
> -	info.dyn_addr = ret;
> +	info.dyn_addr = hci->dyn_addr;

look original code also correct.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  	ret = i3c_master_set_info(m, &info);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 38f927685d3b..ed89228ea971 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -62,6 +62,7 @@ struct i3c_hci {
>  	u8 version_major;
>  	u8 version_minor;
>  	u8 revision;
> +	u8 dyn_addr;
>  	u32 vendor_mipi_id;
>  	u32 vendor_version_id;
>  	u32 vendor_product_id;
> --
> 2.51.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
